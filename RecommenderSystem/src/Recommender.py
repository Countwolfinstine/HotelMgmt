from math import sqrt
import pandas as pd
import csv
import json
import pymysql
from operator import itemgetter

# f = open('data1.csv')
# reader = csv.DictReader(f,delimiter=',')
# dataset = {}
# print(reader)
# for line in reader:
#     print(line)
#     if(line['userid'] not in dataset):
#         dataset[line['userid']] = {}

#     dataset[line['userid']][line['itemid']] = float(line['rating'])

dataset = {}

def doQuery( conn, tableName ) :
    cur = conn.cursor()
    table_lower_case = tableName.lower()
    qry="SELECT * FROM " + table_lower_case
    cur.execute(qry)
    for a in cur.fetchall():
        # uid = a[0] ; iid = a[1] ; rating = a[2]
        if a[0] not in dataset:
            dataset[a[0]] = {}
        dataset[a[0]][a[1]] = float(a[2])

def take_input():
    hostname = 'localhost'
    username = 'root'
    password = ''
    database = 'restaurantmanagement'

    table_name = "rating"
    myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
    doQuery( myConnection,table_name )
    myConnection.close()

    # z=pd.DataFrame(rows, columns=["Itemname", "ordernumber", "date", "time","location"])
    #print(rows[0])


def pearson_correlation(person1,person2):
    # To get both rated items
    both_rated = {}
    for item in dataset[person1]:
        if item in dataset[person2]:
            both_rated[item] = 1
    number_of_ratings = len(both_rated)
    # Checking for number of ratings in common
    if number_of_ratings == 0:
        return 0
    # Add up all the preferences of each user
    person1_preferences_sum = sum([dataset[person1][item] for item in both_rated])
    person2_preferences_sum = sum([dataset[person2][item] for item in both_rated])
    # Sum up the squares of preferences of each user
    person1_square_preferences_sum = sum([pow(dataset[person1][item],2) for item in both_rated])
    person2_square_preferences_sum = sum([pow(dataset[person2][item],2) for item in both_rated])
    # Sum up the product value of both preferences for each item
    product_sum_of_both_users = sum([dataset[person1][item] * dataset[person2][item] for item in both_rated])
    # Calculate the pearson score
    numerator_value = product_sum_of_both_users - (person1_preferences_sum*person2_preferences_sum/number_of_ratings)
    denominator_value = sqrt((person1_square_preferences_sum - pow(person1_preferences_sum,2)/number_of_ratings) * (person2_square_preferences_sum -pow(person2_preferences_sum,2)/number_of_ratings))
    if denominator_value == 0:
        return 0
    else:
        r = numerator_value/denominator_value
        return r

def most_similar_users(person,number_of_users):
    # returns the number_of_users (similar persons) for a given specific person.
    scores = [(pearson_correlation(person,other_person),other_person) for other_person in dataset if  other_person != person ]
    # Sort the similar persons so that highest scores person will appear at the first
    scores.sort()
    scores.reverse()
    return scores[0:number_of_users]

def user_reommendations(person):
    # Gets recommendations for a person by using a weighted average of every other user's rankings
    totals = {}
    simSums = {}
    rankings_list =[]
    for other in dataset:
        # don't compare me to myself
        if other == person:
            continue
        sim = pearson_correlation(person,other)
    # ignore scores of zero or lower
        if sim<=0:
            continue
        for item in dataset[other]:
            # only score items i haven't seen yet
            if item not in dataset[person] or dataset[person][item] == 0:
                # Similrity * score
                totals.setdefault(item,0)
                totals[item] += dataset[other][item]* sim
                # sum of similarities
                simSums.setdefault(item,0)
                simSums[item]+= sim
    # Create the normalized list
    rankings = [(total/simSums[item],item) for item,total in totals.items()]
    rankings.sort()
    rankings.reverse()
    # returns the recommended items
    recommendataions_list = [recommend_item for score,recommend_item in rankings]
    return recommendataions_list

def main():
    uid = 4    
    take_input()
    recommendation_list = user_reommendations(uid)
    print(recommendation_list)

if __name__ == "__main__":
    main()