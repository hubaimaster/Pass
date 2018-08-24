// api/market/market.controller.js

var market = require('../../models/Market')
var util = require('../../utils/util')


exports.register = (req,res) => {
  res.send("Market Register")
}

exports.marketInfo = (req,res) => {
  res.send("Market Info")
}

exports.marketList = (req,res) => {
  res.send("Market List")
}
