// index.js

var express = require('express')
var app = express()
var server = require('http').createServer(app)
var bodyParser = require('body-parser')
var mongoose = require('mongoose')

// DB Setting
mongoose.Promise = global.Promise; // Alternate moongoose Promise to global Promise
mongoose.connect(process.env.MONGO_DB);
var db = mongoose.connection;
db.once("open",function(){
	console.log("DB connected");
});
db.on("error",function(err){
	console.error("DB ERROR :", err);
});

// Middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(function(req,res,next){
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Methods', 'GET, POST, PATCH, DELETE');
	res.header('Access-Control-Allow-Headers', 'content-type, x-access-token');
	next();
});

app.get("/",function(req,res){
	console.log("here")
	res.send("Hello world")
})
app.use("/user",require("./api/user"))
app.use("/pass",require("./api/pass"))
app.use("/market",require("./api/market"))

server.listen(3000,function(){
	console.log("Hello world")
})
