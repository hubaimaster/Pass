// api/user/index.js

var router = require('express').Router()
var controller = require('./user.controller.js')

router.post('/register',controller.register)
router.post('/login',controller.login)
router.put('/',controller.reload)

module.exports = router
