//models/User.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var userSchema = mongoose.Schema({
  _id:{
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

// create a new pass
userSchema.statics.createPass = function(payload){
  console.log("created new pass")

  var pass = new this(payload)

  return pass.save()
}

// find one pass
userSchema.statics.findOneById = function(id){
  console.log("Searching a pass",id)

  return this.findOne({id})
}


var User = mongoose.model("user",userSchema)

module.exports = User
