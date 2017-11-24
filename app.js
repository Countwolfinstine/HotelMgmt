var PythonShell = require('python-shell');
var express = require("express");
var bodyParser = require("body-parser");
var session = require("express-session");
var cors = require("cors");
var path = require("path");
var mysql = require('mysql');

var app = express();

var con = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "Restaurantmanagement"
});
con.connect();

// var con = mysql.createConnection({
//   host: "35.200.142.142",
//   user: "root",
//   password: "root",
//   database: "restaurantmanagement"
// });
// con.connect( function(err){
//     if (err) throw err;
//     console.log("Connected!");
// });

app.use(session({secret: 'randomsecret'}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());
app.use(function(req,res,next){
	console.log(`${req.method} request for '${req.url}' - $(JSON.stringify(req.body)}`);
	next();
});

var options = {
	mode: 'json',
};

var sess;

app.get("/",function(req,res){
	sess = req.session;
	console.log(sess.email + sess.auth);
	if(sess.email) {
		if(sess.auth == "Customer")
			res.redirect('/index.html');
		else if(sess.auth == "Manager")
			res.redirect('/manager.html');
		else if(sess.auth == "Waiter")
			res.redirect('/waiter2.html');
	}
	else {
		console.log("ff");
		res.redirect("/login.html");
	}
});

app.get("/logout-api",function(req,res){
	sess = req.session;
	console.log("logging out " + sess.email);
	sess.auth="";
	sess.email="";
	res.send(200);
});

app.get("/analytics-api",function(req,res){
	con.query("SELECT AVG(rating) AS c,rating.item_id, items.item_name FROM  rating  INNER JOIN items ON (rating.item_id = items.item_id) GROUP BY  item_id " , function(err,result,fields){
		if(err) throw err;
		res.send(result);
	});
});

app.get("/analytics-date-api", function(req,res){
	con.query("SELECT CAST(time AS DATE) AS date1, COUNT(orderid) AS close FROM orders_log WHERE orderid < 250 GROUP BY CAST(time AS DATE)", function(err, result, fields){
		if(err) throw err;
		res.send(result);
	});
});

app.use(express.static("./"));

app.get("/queue-api",function(req,res){
	con.query("SELECT * FROM  current_orders INNER JOIN items ON (current_orders.item_id = items.item_id)" , function (err, result, fields) {
		if (err) throw err;
		console.log(result);
		res.send(result);
	});
});

app.get('/getfood-name/:fname',function(req,res){
	con.query("SELECT item_name FROM items WHERE item_id = " + req.params.fname,function(err,result,fields){
		if(err) throw err;
		res.send(result[0].item_name);
	});
});

app.post("/queue-api", function(req, res){
	console.log('gg');
});

app.delete("/queue-api/:term", function(req,res){
	con.query("DELETE FROM current_orders WHERE order_id = " + req.params.term  , function (err, result, fields) {
		console.log("gg");
		if (err) throw err;
		console.log(result);
	});
	res.send(200);
});

app.get("/manager-api/onload1/", function(req,res){
    console.log("SELECT * FROM `ingredients`"); 
    con.query("SELECT * FROM `ingredients`", function(err1,result1,fields1){
        console.log(result1);
      	if (err1) throw err1;
        res.send(result1);
    });
});

app.get("/manager-api/onload2", function(req,res){
	console.log("SELECT * FROM `ingredients` WHERE quantity<40 ORDER BY quantity DESC");
	con.query("SELECT * FROM `ingredients` WHERE quantity<40 ORDER BY quantity DESC", function(err1,result1,fields1){
		console.log(result1);
		if (err1) throw err1;
		res.send(result1);
	})
});

app.get("/manager-api/update-ingredient/:ingredientName/:ingredientQuantity", function(req,res){
	console.log("request for ingredient updation");
	con.query("UPDATE ingredients SET quantity = " + req.params.ingredientQuantity + " WHERE ing_name = \"" + req.params.ingredientName + "\"", function(err, result, fields){
		if (err) throw err;
		res.send(result);
	});
});

app.get("/manager-api/add-ingredient/:ingredientName/:ingredientQuantity", function(req,res){
	console.log("request for ingredient updation");
	con.query("INSERT INTO ingredients (ing_id, ing_name, quantity) VALUES ( NULL , \""  + req.params.ingredientName + "\", " + req.params.ingredientQuantity+ ");", function(err, result, fields){
		if (err) throw err;
		res.send(result);
	});
});

app.get("/manager-api/add-food/:foodname/:cost", function(req,res){
	con.query("INSERT INTO items (item_name, item_id, price) VALUES ( \""  + req.params.foodname + "\", NULL, " + req.params.cost + ");", function(err, result, fields){
		if (err) throw err;
		res.send(result);
	});
});

var foodId;
var ingId;
app.get("/manager-api/add-food-ingredient/:foodName/:ingredientName/:quantity", function(req,res){
	con.query("SELECT item_id FROM items WHERE item_name =  \"" + req.params.foodName + "\"", function(err, result, fields){
		console.log(result);
		global.foodId= result[0].item_id;
		console.log(global.foodId);
		con.query("SELECT ing_id FROM ingredients WHERE ing_name =  \"" + req.params.ingredientName + "\"", function(err, result, fields){
			console.log(result);
			global.ingId= result[0].ing_id;
			console.log(global.ingId);
			con.query("INSERT INTO ingredients_required (ing_id, item_id, ing_quantity_required) VALUES ( " + global.ingId + "," + global.foodId + "," + req.params.quantity +");", function(err, result, fields){
				if (err) throw err;
				res.send(result);
			});
		});
	});
});

app.post("/signup-api",function(req,res){
	console.log(req.body.userName);
	con.query("INSERT INTO users (emailid, userid, password, username, autorization) VALUES (\"" + req.body.email + "\", NULL, +\"" + req.body.password + "\",\"" + req.body.username + "\", \"Customer\" );", function(err,result,fields){
		if(err) throw err;
		res.send(result);
	});
});

app.post("/login-api", function(req,res){
	sess = req.session;
    console.log(req.body);
    var puncSearchEmail = req.body.email.search("[\"\'\,\\\*]");
    var puncSearchPswd = req.body.password.search("[\"\'\,\\\*]");
    console.log(puncSearchPswd);
    console.log(puncSearchEmail);
    if(puncSearchPswd==-1 && puncSearchEmail==-1){ 
    	con.query("SELECT * FROM users WHERE emailid = \"" + req.body.email + "\" AND password = \"" + req.body.password + "\" ORDER BY `userid` ASC", function(err,result,fields){
    		if(result.length > 0) {
    			sess.email = req.body.email;
    			sess.auth = result[0].autorization;
    			console.log("login " + sess.email + " " + sess.auth);
    			res.send(result);
    		}
    		else {
    			res.send(result);
    		}
    	});
    }
    else{
        res.send("no");
    }
});

app.get("/recommendation-api/:usserid",function(req,res){
	var shell = new PythonShell('/Scripts/Recommender.py', { mode: 'text'});
	shell.send(req.params.usserid);
    //received a message sent from the Python script (a simple "print" statement)
    shell.on('message', function (message) {
    	res.send(message);        
    });
});

app.get("/recommendation-food-api/",function(req,res){
	var shell = new PythonShell('/Scripts/recommend2.py', { mode: 'text'});
	shell.send();
    //received a message sent from the Python script (a simple "print" statement)
    shell.on('message', function (message) {
    	res.send(message);        
    });
});

app.post("/waiter-input",function(req,res){
});

app.get("/check2/:userId/:tableNo",function(req,res){
	console.log("SELECT order_billing.itemid, quantity, price FROM order_billing INNER JOIN items ON order_billing.itemid=items.item_id WHERE userid="+req.params.userId+" AND tableid="+req.params.tableNo);
	con.query("SELECT itemid, item_name, quantity, price FROM order_billing INNER JOIN items ON order_billing.itemid=items.item_id WHERE userid="+req.params.userId+" AND tableid="+req.params.tableNo, function(err,result,fields){
		console.log(result[0].itemid);
		console.log(result[0].quantity);
		res.send(result);
	});
});

app.get("/check2/:userId/:tableNo",function(req,res){
	console.log("SELECT order_billing.itemid, quantity, price FROM order_billing INNER JOIN items ON order_billing.itemid=items.item_id WHERE userid="+req.params.userId+" AND tableid="+req.params.tableNo);
	con.query("SELECT itemid, item_name, quantity, price FROM order_billing INNER JOIN items ON order_billing.itemid=items.item_id WHERE userid="+req.params.userId+" AND tableid="+req.params.tableNo, function(err,result,fields){
		console.log(result[0].itemid);
		console.log(result[0].quantity);
		res.send(result);
	});
});




app.get("/check/:userId/:tableNo",function(req,res){
	console.log("SELECT order_billing.itemid, quantity, price FROM order_billing INNER JOIN items ON order_billing.itemid=items.item_id WHERE userid="+req.params.userId+" AND tableid="+req.params.tableNo);
	con.query("SELECT * FROM order_billing WHERE tableid = "+req.params.tableNo+" AND userid = "+req.params.userId , function(err, result,fields){
		if(err) throw err;
		console.log(result.length)
		if(result.length != 0){
			console.log("gg")
			con.query("SELECT item_name, quantity, price FROM order_billing INNER JOIN items ON order_billing.itemid=items.item_id WHERE userid="+req.params.userId+" AND tableid="+req.params.tableNo, function(err1,result1,fields1){
				if(err1) throw err1;
				console.log(result[0].itemid);
				console.log(result[0].quantity);
				console.log(result1)
				res.send(result1);
			});
		}
		else{
			res.send(result)
		}
	});
});

app.get("/get-menu/:userId",function(req,res) {
	con.query("SELECT * FROM items",function(err,results,fields){
		console.log("hello");
		console.log(results);
		if(err) throw err;
		res.send(results);
	});
});

//get userId as global to be accessed by everyone
//make orderid as auto increment

app.post("/submit-order/",function(req,res){
	for (var i in req.body) {
		if(!(i=="table_no" || i=="submit" || i=="user_id") ){
            //console.log(typeof(i))
            if(req.body[i]!=0 ){
            	console.log(i);
            	var j = parseInt(i);
            	console.log(j);
            	console.log("INSERT INTO order_billing(tableid, orderid, userid, itemid, quantity, time) VALUES (" + req.body.table_no +","+ "NULL" +","+ req.body.user_id +","+ j +","+ req.body[i] +"," + "CURRENT_TIMESTAMP);");
            	con.query("INSERT INTO order_billing(tableid, orderid, userid, itemid, quantity, time) VALUES (" + req.body.table_no +","+ "NULL" +","+ req.body.user_id +","+ j +","+ req.body[i] +"," + "CURRENT_TIMESTAMP);" ,function(err1,result1,fields1){
            		if(err1) throw err1;
            		console.log("SELECT * FROM order_billing WHERE orderid = " + result1.insertId );
            		con.query("SELECT * FROM order_billing WHERE orderid = " + result1.insertId , function(err5,result5,fields5){
            			if(err5) throw err5;
            			console.log("select works");
            			console.log(result5[0].itemid)
            			con.query("INSERT INTO orders_log(orderid, userid, itemid, quantity, time) VALUES ('"+ result1.insertId +"','"+ req.body.user_id +"','"+ result5[0].itemid +"','"+ req.body[i] +"', CURRENT_TIMESTAMP);", function(err2,result2,fields2){
            				if(err2) throw err2;
            				console.log("orders_log");
            			});
            			console.log("INSERT INTO current_orders(order_id, item_id) VALUES ('"+ result1.insertId +"','"+result5[0].itemid+"');");
            			con.query("INSERT INTO current_orders(order_id, item_id) VALUES ('"+ result1.insertId +"','"+result5[0].itemid+"');",function(err3,result3,fields3){
            				if(err3) throw err3;
            				console.log("current_orders");
                            //res.send(result3);
                        });
            		});
            	});
            	con.query("SELECT ingredients_required.item_id, ingredients_required.ing_id, ingredients_required.ing_quantity_required, ingredients.quantity FROM (ingredients INNER JOIN  ingredients_required ON ingredients.ing_id = ingredients_required.ing_id) WHERE ingredients_required.item_id="+i, function(err1,result1,fields1){
            		console.log(result1);
            		console.log(result1[0].item_id);
            		for (var x in result1) {
            			var c = result1[x].item_id
            			var amt = parseInt(result1[x].quantity) - req.body[c] * parseInt(result1[x].ing_quantity_required);
            			console.log(amt);
            			console.log("UPDATE ingredients SET quantity = "+ amt + " WHERE ing_id="+result1[x].ing_id);
            			con.query("UPDATE ingredients SET quantity = "+ amt + " WHERE ing_id="+result1[x].ing_id, function(err2,result2,fields2){
            				if (err2) throw err2;
            				console.log(result2);
            			});
            		}
            	});
            }
        }		
    }
    res.send(200);
});

app.get("/billing-api/:userid/:tableid",function(req,res){
	console.log("DELETE FROM order_billing WHERE tableid = " + req.params.tableid+" AND  userid = " + req.params.userid);
	con.query("DELETE FROM order_billing WHERE tableid = " + req.params.tableid+" AND  userid = " + req.params.userid, function(err,result,fields){
		res.send(result);
	});
});

app.post("/submit-rating/",function(req,res){
	console.log(req.body);
	for (var i in req.body) {
		if(!(i=="table_no" || i=="submit" || i=="user_id")){
			if (req.body[i]!=0){
				ratinginsert(req.body.user_id, req.body[i], i);
			}
		}
	}
	res.send(200);
});

function ratinginsert(uid, rating, item_id){
	console.log("SELECT userid, item_id, rating FROM rating WHERE userid = "+uid+ " AND item_id = "+ item_id)
	con.query("SELECT userid, item_id, rating FROM rating WHERE userid = "+uid+ " AND item_id = "+ item_id, function(err, result,fields){
		if(err) throw err;
		if(result.length == 0) {
			console.log("INSERT INTO rating (userid, item_id, rating) VALUES ( "+ uid +"," + rating + ", "+item_id+") ")
			con.query("INSERT INTO rating (userid, item_id, rating) VALUES ( "+ uid +"," + item_id + ", "+rating+") ", function(err1,result1,fields1){
				if (err1) throw err1;
			});
		}
		else{
			console.log("UPDATE rating SET  rating ="+ rating +" WHERE  userid = " + uid + " AND item_id =" + item_id)
			con.query("UPDATE rating SET  rating ="+ rating +" WHERE  userid = " + uid + " AND item_id =" + item_id, function(err2,result2,fields2){
				if(err2) throw err2;
			});
		}		
	});
}

app.get("/sentiment-api", function(req,res){
	var shell = new PythonShell('/Scripts/sentimentAnalysis.py', { mode: 'text'});
	shell.send();
	shell.on('message', function (message) {
		res.send(message);
	});
});

app.listen(3000);

console.log("Express running on port 3000");

module.export = app;