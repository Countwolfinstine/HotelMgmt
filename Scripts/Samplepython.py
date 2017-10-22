import pandas as pd
import numpy as np
import json
import pymysql
from operator import itemgetter

hostname = 'localhost'
username = 'root'
password = ''
database = 'restaurantmgmt'
rows=[]

def doQuery( conn, hesaru ) :
    cur = conn.cursor()
    tblold=hesaru.lower()
    qry="SELECT * FROM " + tblold
    cur.execute(qry)
    for a in cur.fetchall():
      b={}
      b['f']=a[0]
      b['e']=a[1]
      b['s']=a[2]
      
      rows.append(b)

tablName="currentorder"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection,tablName )
myConnection.close()
# z=pd.DataFrame(rows, columns=["Itemname", "ordernumber", "date", "time","location"])
print(json.dumps(rows))