// api/market/index.js

var router = require('express').Router()
var controller = require('./market.controller.js')

router.post('/',controller.register)
router.get('/',controller.marketInfo)
router.patch('/near',controller.nearMarketList)
router.patch('/users',controller.usersMarketList)

module.exports = router
