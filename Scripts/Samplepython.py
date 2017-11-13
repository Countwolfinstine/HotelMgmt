import pandas as pd
import numpy as np
import json
import pymysql
from operator import itemgetter

hostname = 'localhost'
username = 'root'
password = ''
database = 'restaurantmanagement'
rows=[]

def doQuery( conn, tableName ) :
    cur = conn.cursor()
    tblold=tableName.lower()
    qry="SELECT * FROM " + tblold
    cur.execute(qry)
    for a in cur.fetchall():
    	# print(type(a))
    	rows.append(a)

tablName="orders_log"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection,tablName )
myConnection.close()
# z=pd.DataFrame(rows, columns=["Itemname", "ordernumber", "date", "time","location"])
print(rows[0])