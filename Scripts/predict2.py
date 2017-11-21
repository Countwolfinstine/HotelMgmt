from sklearn.linear_model import LinearRegression
import pandas as pd
import datetime
import pymysql
from operator import itemgetter
import numpy as np
from datetime import datetime as dt
hostname = 'localhost'
username = 'root'
password = ''
database = 'restaurantmgmt'
rows=[]
rows1=[]
rows2=[]
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
		b["quantity"]=a[3]
		b["time"]=a[4]
		rows.append(b)
def doQuery2( conn, hesaru ) :
	cur = conn.cursor()
	tblold=hesaru.lower()
	qry="SELECT * FROM " + tblold
	cur.execute(qry)
	for a in cur.fetchall():
		b={}
		b['item_id']=a[0]
		b['ing_id']=a[1]
		b['ing_quantity_required']=a[2]
		rows1.append(b)
def doQuery3( conn, hesaru ) :
	cur = conn.cursor()
	tblold=hesaru.lower()
	qry="SELECT * FROM " + tblold
	cur.execute(qry)
	for a in cur.fetchall():
		b={}
		b['ing_id']=a[0]
		b['ing_name']=a[1]
		b['qty']=a[2]
		rows2.append(b)
	  
tablName="orders_log"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection,tablName )
df1=pd.DataFrame(rows, columns=["orderid","userid","itemid","quantity","time"])

tablName="ingredients_required"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery2(myConnection,tablName )
df2=pd.DataFrame(rows1, columns=["item_id","ing_id","ing_quantity_required"])

tablName="ingredients"
myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
doQuery3(myConnection,tablName )
df3=pd.DataFrame(rows2, columns=["ing_id","ing_name","qty"])

myConnection.close()

dates=set(x.date().strftime("%d/%m/%Y") for x in df1["time"])
df1["time"]=df1['time'].apply(lambda x: x.strftime('%d/%m/%Y'))
max_date=df1["time"].max()
item=set(df1["itemid"])
ing=set(df3["ing_id"])
dict1={}#{"date1":{"item1":"quantity","item2":"qunatity",...},....}
#calculating the actual ingredients used in a day
for i in dates:
	l1=df1.loc[df1["time"]==i]
	#print(l1)
	dict2={}
	for j in item:
		l2=l1.loc[l1["itemid"]==j]#to get quantity
		l3=df2.loc[df2["item_id"]==j]#to get how many ingredients one item needs
		#print(l3)
		for l,k in l3.iterrows(): 
			if(k["ing_id"] in dict2):
				dict2[k["ing_id"]]+=sum(l2["quantity"])*k["ing_quantity_required"]
			else:
				dict2[k["ing_id"]]=sum(l2["quantity"])*k["ing_quantity_required"]
	dict1[i]=dict2
#print(dict1)
pred={}
print(dates)
#Prediction for all ingredients
for j in ing:
	#print("ingredient",j)
	lm=LinearRegression()
	count=0
	X1=[]
	X2=[]
	for k in dates:
		if(k!=max_date):
			X2.append(dict1[k][j])
			X1.append(dt.strptime(k, '%d/%m/%Y').toordinal())
	X=pd.DataFrame()	
	X["date"]=X1
	Y=pd.DataFrame()
	Y["quantity"]=X2
	#print(X)
	#print(Y)
	lm.fit(X,Y)
	d1=dt.strptime(max_date,'%d/%m/%Y').date().toordinal()
	Z=pd.DataFrame([d1])
	#print(Z)
	p=lm.predict(Z)
	pred[j]=p
	#print(p)
print(max_date)
print(pred)
