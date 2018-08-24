// api/market/index.js

var router = require('express').Router()
var controller = require('./market.controller.js')

router.post('/',controller.register)
router.get('/',controller.marketInfo)
router.patch('/',controller.marketList)

module.exports = router
