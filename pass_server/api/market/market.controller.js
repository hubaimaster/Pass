// api/market/market.controller.js

var market = require('../../models/Market')
var util = require('../../utils/util')


exports.register = (req,res) => {
  res.send("Market Register")
  var payload = req.body

  var onSuccess = (pass) => {
    console.log(pass)
    res.status(200).json(util.successTrue(pass))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  market.createMarket(payload)
  .then(onSuccess)
  .catch(onError)
  
}

exports.marketInfo = (req,res) => {
  res.send("Market Info")
  
  var id = req.param.marketId

  var onSuccess = (pass) => {
    console.log(pass)
    res.status(200).json(util.successTrue(pass))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  market.findOneById(id)
  .then(onSuccess)
  .catch(onError)
}

exports.marketList = (req,res) => {
  res.send("Market List")
}
