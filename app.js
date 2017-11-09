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
    console.log("UPDATE ingredients SET quantity = " + req.params.ingredientQuantity + " WHERE ing_name = " + req.params.ingredientName);
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


app.get("/menu-display/:usserid",function(req,res){
    
    var shell = new PythonShell('/RecommenderSystem/src/Recommender.py', { mode: 'json'});
    console.log("yolo1");
    
    con.query("SELECT * from currentorder", function(err,results,fields){
        console.log(results);
        // console.log("yolo2");
        if(err) throw err;
        // console.log(results);
        shell.send(results);
        // console.log("yolo3");
        shell.on('message', function (message) {
            // received a message sent from the Python script (a simple "print" statement)
            console.log(message);
        });
        // end the input stream and allow the process to exit
        shell.end(function (err) {
            if (err) throw err;
            console.log('finished');
        });
    
    });
    
    con.query("SELECT * FROM currentorder", function (err, result, fields) {
        if (err) throw err;
        res.send(result);
    });
    
});

app.listen(3000);

console.log("Express running on port 3000");

module.export = app;	 