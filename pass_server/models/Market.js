//models/Market.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var marketSchema = mongoose.Schema({
  id:{
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

var Market = mongoose.model("market",marketSchema)

module.exports = Market
