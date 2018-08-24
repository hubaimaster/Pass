//models/User.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var userSchema = mongoose.Schema({
  id:{
    type:String,
    default:function genUUID(){uuid.v4()}
  },
  name:{
    type:String
  },
  password:{
    type:String,
    require:true
  },
  email:{
    type:String,
    require:true
  },
  group:{
    type:String
  },
  money:{
    type:Number,
    default:0
  },
  creationDate:{
    type:Number,
    default:Date.now()
  }
})

var User = mongoose.model("user",userSchema)

module.exports = User
