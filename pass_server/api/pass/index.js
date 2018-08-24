// api/pass/index.js

var router = require('express').Router()
var controller = require('./pass.controller.js')

router.post('/',controller.newPass)
router.get('/',controller.getPass)
router.patch('/',controller.getPassList)
router.delete('/',controller.delPass)

module.exports = router
