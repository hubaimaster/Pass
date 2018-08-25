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
exports.nearMarketList = (req,res) => {
  var {lat,lng} = req.body

  var onSuccess = (marketList) => {
    marketList.forEach(packing,this)
    console.log(marketList)
    res.status(200).json(util.successTrue(marketList))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  market.findNearMarket(lat,lng)
  .then(onSuccess)
  .catch(onError)
}

// PATCH
// find users' markets' list
exports.usersMarketList = (req,res) => {
  var userId = req.body.userId

  var onSuccess = (marketList) => {
    marketList.forEach(packing,this)
    console.log(marketList)
    res.status(200).json(util.successTrue(marketList))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  market.findUsersMarket(userId)
  .then(onSuccess)
  .catch(onError)
}

var packing = (item,index,arr) => {
  arr[index] = {"data":item}

}
