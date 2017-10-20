/* jshint esnext: true */
var http = require('http');
var fs = require('fs');
var url = require('url');

var path = require("path");

http.createServer(function (req, res){
	var q = url.parse(req.url, true);
			

	if (req.url.match(/.html$/)){
		console.log(`${req.method} request for ${req.url} ${filename}`)
		var filename = "." + req.url;
		fs.readFile(filename, function(err, data){
			if(err){
				res.writeHead(404,{'Content-Type':'text/html'})
				return res.end("404 Not Found");
			}
			res.writeHead(200,{'Content-Type': 'text/html'});
			res.write(data);
			return res.end();
		});
		}
	else if (req.url.match(/.css$/)) {
				console.log(`${req.method} request for ${req.url} ${filename}`)

		var cssPath = "." + req.url;
		var fileStream = fs.createReadStream(cssPath, "UTF-8");

		res.writeHead(200, {"Content-Type": "text/css"});

		fileStream.pipe(res);

	} else if (req.url.match(/.jpg$/)) {
		console.log(`${req.method} request for ${req.url} ${filename}`)

		var imgPath =  "." + req.url;
		var imgStream = fs.createReadStream(imgPath);

		res.writeHead(200, {"Content-Type": "image/jpeg"});

		imgStream.pipe(res);

	} 
	else if (req.url.match(/.js$/)) {
		console.log(`${req.method} request for ${req.url} ${filename}`)

		var imgPath =  "." + req.url;
		var imgStream = fs.createReadStream(imgPath);

		res.writeHead(200, {"Content-Type": "text/javascript"});

		imgStream.pipe(res);

	} 


	else {
		res.writeHead(404, {"Content-Type": "text/plain"});
		res.end("404 File Not Found");
	}

}).listen(8080);