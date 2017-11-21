import pandas as pd
import datetime
import operator
import json
import pymysql
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
		b['orderid']=a[0]
		b['userid']=a[1]
		b['itemid']=a[2]
		b['quantity']=a[3]
		b['time']=a[4]
		rows.append(b)

tablName="orderlog"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection,tablName )
myConnection.close()
df1=pd.DataFrame(rows, columns=["orderid","userid","itemid","quantity","time"])
print(df1)
#df1=pd.read_csv("orderlog.csv")
item=set(df1["itemid"])
dates=set(x.date() for x in df1["time"])
times=(x.time() for x in df1["time"])
timeslots=["8:0:0-11:0:0","11:0:0-14:0:0","14:1:0-17:0:0","17:1:0-20:0:0","20:1:0-23:0:0"]
#print(dates)
def time_in_range(start, end, x):
	if start <= end:
		return start <= x <= end
	else:
		return start <= x or x <= end
#dict2=dict((e,0) for e in item)
dict1={}
#dict1=dict((n,dict2) for n in timeslots)
print(dict1)
for i,v in df1.iterrows():
	#print(v["itemid"])
	t=v["time"].time()
	dict2=dict((e,0) for e in item)
	dict3={}
	#print(t,v["itemid"])
	for n in timeslots:
		t1=n.split("-")[0]
		t2=n.split("-")[1]
		#print(time_in_range(t1,t2,t))
		if time_in_range(t1,t2,t.strftime('%H:%M:%S')):
			if(n in dict1):
				dict1[n][v["itemid"]]=dict1[n][v["itemid"]]+1
			else:
				dict1[n]=dict((e,0) for e in item)
			break
	#print(dict1)
	
for k in dict1:
	dict1[k]=max(dict1[k].items(), key=operator.itemgetter(1))[0]
print(dict1)