//models/Market.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var marketSchema = mongoose.Schema({
  _id:{
    type:String,
    default:uuid.v4
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
  location:{
    type: {type:String},
    coordinates: []
  },
  userId:{
    type:String
  },
  creationDate:{
    type:Number,
    default:Date.now()
  }
})

marketSchema.index({location:"2dsphere"})

// create a new pass
marketSchema.statics.createMarket = function(payload){
  console.log("created new market")

  var market = new this(payload)

  return market.save()
}

// find one pass
marketSchema.statics.findOneById = function(id){
  console.log("Searching a market",id)

  return this.findOne({id})
}


var Market = mongoose.model("market",marketSchema)

module.exports = Market
