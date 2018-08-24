// api/user/user.controller.js

var user = require('../../models/User')
var util = require('../../utils/util')


exports.register = (req,res) => {
  res.send("User Register")
}

exports.login = (req,res) => {
  res.send("User login")
}
