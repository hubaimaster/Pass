// index.js

var express = require('express')
var app = express()
var server = require('http').createServer(app)
var bodyParser = require('body-parser')

app.get("/",function(req,res){
	console.log("here")
	res.send("Hello world")
})

// Middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(function(req,res,next){
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
	res.header('Access-Control-Allow-Headers', 'content-type, x-access-token');
	next();
});

app.use("/user",require("./api/user"))
app.use("/pass",require("./api/pass"))
app.use("/market",require("./api/market"))

server.listen(3000,function(){
	console.log("Hello world")
})
