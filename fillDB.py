from random import randrange
import time
import random
import csv
import string

# restaurant start and end time
start_timestamp = time.mktime(time.strptime('2017-09-08 07:30:00', '%Y-%m-%d %H:%M:%S'))
end_timestamp = time.mktime(time.strptime('2017-09-08 22:30:00', '%Y-%m-%d %H:%M:%S'))

# waiter_id made global because of the intention that it might be used for the new waiter_id table.
waiter_id = []
user_id = []
item_id = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
order_id = []

# gen_password(length) is used to generate password based on desired length
def gen_password(length):
    letters = string.ascii_lowercase + string.ascii_uppercase
    return ''.join(random.choice(letters) for i in range(length))

# randomize_time(start_time, end_time) returns a timestamp in between the start and end timestamp
def randomize_time(start_timestamp,end_timestamp):
    return time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(randrange(start_timestamp,end_timestamp)))

# choose a customer
def pick_customer(user_id):
    flag = True
    uid = random.choice(user_id)
    while flag:
        if uid in waiter_id:
            uid = random.choice(user_id)
        else:
            flag = False
    return uid

def fill_items_table():
    global item_id

    item_name = ["Dosa","Idli","Vada","Biriyani","Dal Makhani","Dal","Mixed Veg","Aalo Gobhi","Pav Bhaji","Paalak Paneer","Chole-Bhature","Puri","Naan","Roti"]
    #item_id = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    price = [25, 20, 20, 40, 50, 20, 50, 40, 30, 40, 50, 20, 25, 25]
    for i in range(len(item_name)):
        f=open(r'Items.csv', 'a',newline='')
        with f:
            writer = csv.writer(f)
            name = item_name[i]
            iid = item_id[i]
            rate = price[i]
            row = [name, iid, rate]
            writer.writerow(row)
    f.close()
    return

def fill_users_table(num_of_users, total_num_waiters):
    global waiter_id, user_id

    first_name = ["Ram","Sham","Ramesh","Rajesh","Sam","Surya","Tom"]
    last_name = ["John","Iyer","Prasad","Kumar","Jain","Shankar","Bhat"]
    auth_value = ["Waiter","Customer"]
    email_values = ['@gmail.com', '@yahoo.com', '@hotmail.com', '@live.com']
    num_of_waiters_count = 0

    for i in range(1, num_of_users+1):
        f = open(r'Users.csv', 'a',newline='')
        with f:
            writer = csv.writer(f)
            fname = first_name[randrange(0, len(first_name))]
            lname = last_name[randrange(0, len(last_name))]
            authorization = auth_value[randrange(0, len(auth_value))]
            if authorization=='Waiter':
                if num_of_waiters_count>=total_num_waiters:
                    authorization = 'Customer'
                num_of_waiters_count = num_of_waiters_count + 1
            uid = i
            user_id.append(uid)
            if authorization=='Waiter':
                waiter_id.append(uid)
            email_id = fname+'.'+lname+str(randrange(0, 100))+email_values[randrange(0, len(email_values))]
            password = gen_password(randrange(7, 10))
            row = [email_id, uid, password, fname, lname, authorization]
            writer.writerow(row)
    f.close()
    return

def fill_order_table(num_of_orders, num_of_tables):
    global user_id, item_id, waiter_id

    orders = 1
    while orders<=num_of_orders:
        f = open(r'Order.csv', 'a', newline = '')
        f1 = open(r'Orderlog.csv', 'a', newline = '')
        f2 = open(r'CurrentOrder.csv', 'a', newline = '')
        f3 = open(r'Rating.csv', 'a', newline = '')
        with f:
            writer = csv.writer(f)
            tableid =  randrange(1, num_of_tables)
            uid = pick_customer(user_id)
            oid = orders
            orders = orders + 1
            order_id.append(oid)
            iid = random.choice(item_id)
            quantity = randrange(1, 5)
            # manipulate timestamp to generate better data
            timestamp = randomize_time(start_timestamp, end_timestamp)
            row = [tableid, oid, uid, iid, quantity, timestamp]
            writer.writerow(row)
            with f1:
                writer1 = csv.writer(f1)
                row1 = [oid, uid, iid, quantity, timestamp]
                writer1.writerow(row1)
            f1.close()
            if orders%3 == 0:
                writer2 = csv.writer(f2)
                row2 = [oid, iid]
                writer2.writerow(row2)
            f2.close()
            with f3:
                writer3 = csv.writer(f3)
                row3 = [uid, iid, randrange(1, 5)]
                writer3.writerow(row3)
            f3.close()
    f.close()
    return

def main():
    fill_items_table()
    fill_users_table(50, 8)
    fill_order_table(40, 5)
main()
