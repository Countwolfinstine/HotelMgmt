var express = require("express");
var cors = require("cors");
var PythonShell = require('python-shell');
var path = require("path");
var PythonShell = require('python-shell');
var options = {
    mode: 'json',
   
};
var app = express();

var sk = [
    {
        term: "Rip",
        food: "xyz",
        defined: "To move at a high rate of speed"
    },
    {
        term: "Huck",
        food: "xyz",
        defined: "To throw your body off of something, usually a natural feature like a cliff"
    },
    {
        term: "Chowder",
        food: "xyz",
        defined: "Powder after it has been sufficiently skied"
    }
];



app.use(function(req,res,next){
	console.log(`${req.method} request for '${req.url}'`);
	next();
});

app.use(express.static("./"))

app.use(cors());

app.get("/queue-api",function(req,res){

PythonShell.run('/scripts/Samplepython.py', options, function (err, results) {
    if (err) throw err;
    console.log(results);
	res.send(results);

});

});

app.listen(3000);

console.log("Express running on port 3000");

module.export = app;	 