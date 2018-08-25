//models/Market.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var marketSchema = mongoose.Schema({
  _id:{
    type:String,
    default:function genUUID(){uuid.v4()}
  },
  name:{
    type:String
  },
  bankName:{
    type:String
  },
  accountNumber:{
    type:String
  },
  lat:{
    type:Number
  },
  lng:{
    type:Number
  },
  userId:{
    type:String
  },
  creationDate:{
    type:Number,
    default:Date.now()
  }
})
// create a new pass
marketSchema.statics.createPass = function(payload){
  console.log("created new pass")

  var pass = new this(payload)

  return pass.save()
}

// find one pass
marketSchema.statics.findOneById = function(id){
  console.log("Searching a pass",id)

  return this.findOne({id})
}


var Market = mongoose.model("market",marketSchema)

module.exports = Market
