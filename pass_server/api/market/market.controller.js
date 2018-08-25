// api/market/market.controller.js

var market = require('../../models/Market')
var util = require('../../utils/util')

// POST
// register new market
exports.register = (req,res) => {
  var payload = req.body

  var onSuccess = (market) => {
    console.log(market)
    res.status(200).json(util.successTrue())
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  market.createMarket(payload)
  .then(onSuccess)
  .catch(onError)

}

// GET
// find a market by id
exports.marketInfo = (req,res) => {
  var marketId = req.param.marketId

  var onSuccess = (market) => {
    console.log(market)
    res.status(200).json(util.successTrue(market))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  market.findOneById(marketId)
  .then(onSuccess)
  .catch(onError)
}

// PATCH
// find near markets' list by location
exports.marketList = (req,res) => {
  res.send("Market List")
}
