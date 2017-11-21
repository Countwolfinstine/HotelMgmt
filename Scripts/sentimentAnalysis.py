import copy
import re
import nltk
import json
import pymysql
import numpy as np
from nltk.corpus import stopwords
from nltk.sentiment.vader import SentimentIntensityAnalyzer


hostname = 'localhost'
username = 'root'
password = ''
database = 'restaurantmanagement'
rows = []

def tokenize_only(text):
    # first tokenize by sentence, then by word to ensure that punctuation is caught as it's own token
    tokens = [word.lower() for sent in nltk.sent_tokenize(text) for word in nltk.word_tokenize(sent)]
    filtered_tokens = []
    # filter out any tokens not containing letters (e.g., numeric tokens, raw punctuation)
    for token in tokens:
        if re.search('[a-zA-Z]', token):
            filtered_tokens.append(token)
    return filtered_tokens

def fetch_ratings(conn):
    
    l = []
    cur = conn.cursor()
    qry = "SELECT * FROM feedback"
    cur.execute(qry)
    for a in cur.fetchall():
        # print(type(a))
        l.append(a)
    return l

if __name__ == '__main__':            
    myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )

    l = fetch_ratings(myConnection) 
    sentiment_strings = [] 
    for key in l:    
        sentiment_strings.append(key[1])  
    stop = set(stopwords.words('english'))
    sid = SentimentIntensityAnalyzer()
    sentences = []
    sentences_string = ""
    for i in sentiment_strings:
        sentences.append(i)
    sentiments = [None] * len(sentences)
    for i in range(len(sentences)):
        sentiments[i] = sid.polarity_scores(sentences[i])["compound"]
    avg_sentiment = sum(sentiments)/len(sentiments)
    result = {}

    if avg_sentiment > 0.75 :
        result["0"] = " Largly positive"
    elif avg_sentiment > 0.33 :
        result["0"] = " Generally positive"
    elif avg_sentiment > 0 :
        result["0"] = "Mixed "
    elif avg_sentiment > -0.4  :
        result["0"] = " Generally negative"
    else:
        result["0"] = " Mostly negative"

    #most negative
    result["1"] = sentences[ sentiments.index(sorted(sentiments)[0])] 
    # print "-----------------------------------"
    #most positive
    result["2"] = sentences[ sentiments.index(sorted(sentiments)[len(sentiments)-1])]

    print(json.dumps(result))
    

