// index.js

var express = require('express')
var app = express()
var server = require('http').createServer(app)

app.get("/",function(req,res){
	console.log("here")
	res.send("Hello world")
})

server.listen(3000,function(){
	console.log("Hello world")
})
