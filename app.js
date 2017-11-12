var PythonShell = require('python-shell');
var express = require("express");
var bodyParser = require("body-parser")
var cors = require("cors");
var path = require("path");
var app = express();

var mysql = require('mysql');
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "RestaurantManagement"
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

var options = {
    mode: 'json',
};

app.use(function(req,res,next){
	console.log(`${req.method} request for '${req.url}' - $(JSON.stringify(req.body)}`);
	next();
});

app.use(express.static("./"))

app.use(cors());

con.connect();
app.get("/queue-api",function(req,res){
    con.query("SELECT * FROM currentorder", function (err, result, fields) {
        if (err) throw err;
        res.send(result);
    });
});

app.post("/queue-api", function(req, res){
    console.log('gg');
});

app.delete("/queue-api/:term", function(req,res){
    console.log("gg");
    con.query("SELECT * FROM currentorder", function (err, result, fields) {
        if (err) throw err;
        res.send(result);
    });
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
    con.query("INSERT INTO users (emailid, userid, password, username, autorization) VALUES (\" " + req.body.email + "\", NULL, +\"" + req.body.password + "\",\"" + req.body.username + "\", \" Customer\" );", function(err,result,fields){
        if(err) throw err;
        res.send(result);
    })

});


app.post("/login-api", function(req,res){
    console.log("SELECT * FROM users WHERE emailid = \"" + req.body.email + "\" AND password = \"" + req.body.password + "\" ORDER BY userid ASC")
    con.query("SELECT * FROM users WHERE emailid = \"" + req.body.email + "\" AND password = \"" + req.body.password + "\" ORDER BY `userid` ASC", function(err,result,fields){
        console.log(result.length)
        res.send(result)
    });
});

app.get("/menu-display/:usserid",function(req,res){    
    // var shell = new PythonShell('/RecommenderSystem/src/Recommender.py', { mode: 'json'});    
    // con.query("SELECT * from currentorder", function(err,results,fields){
    //     console.log(results);
    //     if(err) throw err;
    //     shell.send(results);
    //     shell.on('message', function (message) {
    //         // received a message sent from the Python script (a simple "print" statement)
    //         console.log(message);
    //     });
    //     // end the input stream and allow the process to exit
    //     shell.end(function (err) {
    //         if (err) throw err;
    //         console.log('finished');
    //     });
    // });
    con.query("SELECT * FROM items", function (err, result, fields) {
        if (err) throw err;
        res.send(result);
    });
});

app.post("/waiter-input",function(req,res){




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
    //console.log(req['body']);
    //console.log(req['body'].length);
    for (var i in req['body']) {
      //console.log(i);

      if(!(i=="table_no" || i=="submit" || i=="user_id") ){
        //console.log(typeof(i))
        if(req['body'][i]!=0 ){
            console.log(i)
        var j = parseInt(i);
        console.log(j); 
        
            //console.log(req['body'][i]);
            //INSERT INTO `restaurantmanagement`.`order` (`tableid`, `orderid`, `userid`, `itemid`, `quantity`, `time`) VALUES ('3', '13', '3', '3', '2', CURRENT_TIMESTAMP);
            console.log("INSERT INTO allorders(tableid, orderid, userid, itemid, quantity, time) VALUES (" + req['body']["table_no"] +","+ "NULL" +","+ req['body']['user_id'] +","+ j +","+ req['body'][i] +"," + "CURRENT_TIMESTAMP);");
            con.query("INSERT INTO allorders(tableid, orderid, userid, itemid, quantity, time) VALUES (" + req['body']["table_no"] +","+ "NULL" +","+ req['body']['user_id'] +","+ j +","+ req['body'][i] +"," + "CURRENT_TIMESTAMP);" ,function(err1,result1,fields1){
                if(err1) throw err1;
                console.log("SELECT * FROM allorders WHERE orderid = " + result1.insertId )
                con.query("SELECT * FROM allorders WHERE orderid = " + result1.insertId , function(err5,result5,fields5){
                     if(err5) throw err5;      
                     console.log("select works")  
                     console.log(result5[0].itemid)
                    con.query("INSERT INTO orderlog(orderid, userid, itemid, quantity, time) VALUES ('"+ result1.insertId +"','"+ req['body']['user_id'] +"','"+ result5[0].itemid +"','"+ req['body'][i] +"', CURRENT_TIMESTAMP);", function(err2,result2,fields2){
                        if(err2) throw err2;
                        //res.send(result2);
                        //INSERT INTO `restaurantmanagement`.`currentorder` (`order_id`, `item_id`) VALUES ('3', '3');
                        console.log("orderlog");
                       
                        
                    });
                    console.log("INSERT INTO currentorder(order_id, item_id) VALUES ('"+ result1.insertId +"','"+result5[0].itemid+"');");
                    con.query("INSERT INTO currentorder(order_id, item_id) VALUES ('"+ result1.insertId +"','"+result5[0].itemid+"');",function(err3,result3,fields3){
                        if(err3) throw err3;
                        console.log("currentorder");
                        //res.send(result3);
                    });                    
                 });    
             });
        }
    }
  }
  res.send(200);    
});

app.get("/check/:userId/:tableNo",function(req,res){

});

app.listen(3000);

console.log("Express running on port 3000");

module.export = app;	 