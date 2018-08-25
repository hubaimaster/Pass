// api/user/index.js

var router = require('express').Router()
var controller = require('./user.controller.js')

router.post('/register',controller.register)
router.post('/login',controller.login)

module.exports = router
