//models/Pass.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')

var passSchema = mongoose.Schema({
  id:{
    type:String,
    default:function genUUID(){uuid.v4()}
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
  creationDate:{
    type:Number,
    default:Date.now()
  }
})

var Pass = mongoose.model("pass",passSchema)

module.exports = Pass
