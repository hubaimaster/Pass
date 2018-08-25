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
marketSchema.statics.findOneById = function(marketId){
  console.log("Searching a market",marketId)

  return this.findOne({id:marketId})
}

marketSchema.statics.findUsersMarket = function(userId){
  console.log("Searching a user's marketlist",userId)

  return this.find({userId})
}

marketSchema.statics.findNearMarket = function(lat,lng){
  console.log("Searching near marketlist",lat,lng)

  var geospartial = {type:"Point",coordinates:[lng,lat]}

  return this.find({location: {
                      $near: {
                        $maxDistance: 20,
                        $geometry: geospartial
                      }
                    }
                  })
}

var Market = mongoose.model("market",marketSchema)

module.exports = Market
