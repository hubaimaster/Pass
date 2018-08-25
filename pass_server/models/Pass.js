//models/Pass.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var passSchema = mongoose.Schema({
  _id:{
    type:String,
    default:uuid.v4
  },
  userId:{
    type:String,
    require:true
  },
  marketId:{
    type:String,
    require:true
  },
  money:{
    type:Number,
    require:true
  },
  tableName:{
    type:String,
    require:true
  },
  status:{
    type:Number,
    default:0,
    require:true
  },
  creationDate:{
    type:Number,
    default:new Date().getTime()
  }
})

// create a new pass
passSchema.statics.createPass = function(payload){
  console.log("created new pass")

  var pass = new this(payload)

  return pass.save()
}

// find one pass
passSchema.statics.findOneById = function(id){
  console.log("Searching a pass",id)

  return this.findOne({_id:id})
}

// find pass id list by marketId
passSchema.statics.findListByMarketId = function(marketId){
  console.log("Seraching a list",marketId)

  return this.find({marketId}).sort({creationDate:'desc'})
}

passSchema.statics.deleteOneById = function(id){
  console.log("Deleting a pass",id)

  return this.deleteOne({_id:id})
}

passSchema.statics.pass = function(passId){
  console.log("Pass",passId)

  return this.findOneAndUpdate({_id:passId},{status:1},{new:true})
}

var Pass = mongoose.model("pass",passSchema)

module.exports = Pass
