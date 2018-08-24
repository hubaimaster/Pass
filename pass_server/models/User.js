//models/User.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var userSchema = mongoose.Schema({
  id:{
    type:String,
    default:function genUUID(){uuid.v4()}
  }
})
