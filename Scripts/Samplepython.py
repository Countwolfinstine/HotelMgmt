import pandas as pd
import numpy as np
import json
import pymysql
from operator import itemgetter

hostname = 'localhost'
username = 'root'
password = ''
database = 'moder'
rows=[]

def doQuery( conn, hesaru ) :
    cur = conn.cursor()
    tblold=hesaru.lower()
    qry="SELECT * FROM " + tblold
    cur.execute(qry)
    for a in cur.fetchall():
      rows.append(a)

tablName="queues"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection,tablName )
myConnection.close()
z=pd.DataFrame(rows, columns=["Itemname", "ordernumber", "date", "time","location"])
print(z.head())