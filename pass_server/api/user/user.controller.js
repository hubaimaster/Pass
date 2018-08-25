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
// POST
// user login
exports.login = (req,res) => {
  var email = req.body.email
  var password = req.body.password

  var authenticate = (user) => {
    if(!user){//User doesn't exist
      throw new Error('Login Failed')
    } else {
      return new Promise((resolve) => {
        if(user.authenticate(password)) resolve(user)
        else throw new Error('Invalid Password')
      })
    }
  }

  var onSuccess = (user) => {
      console.log(user)
      res.status(200).json(util.successTrue(user))
  }
  var onError = (error) => {
      console.error(error)
      res.status(400).json(util.successFalse(error))
 }
 user.findOneByEmail(email)
 .then(authenticate)
 .then(onSuccess)
 .catch(onError)
}
