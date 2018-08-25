// api/user/user.controller.js

var user = require('../../models/User')
var util = require('../../utils/util')

// POST
// register new user
exports.register = (req,res) => {
  var payload = req.body

  var onSuccess = (user) => {
   console.log(user)
   res.status(200).json(util.successTrue(user))
  }

  var onError = (error) => {
        console.error(error)
        res.status(400).json(util.successFalse(error))
  }
  user.createUser(payload)
  .then(onSuccess)
  .catch(onError)


}
// GET
// user login
exports.login = (req,res) => {
  var pqyload = req.param

  var onSuccess = (user) => {
      console.log(pass)
      res.status(200).json(util.successTrue(user))
  }
  var onError = (error) => {
      console.error(error)
      res.status(400).json(util.successFalse(error))
 }
 user.findOneById(payload)
 .then(onSuccess)
 .catch(onError)
}
