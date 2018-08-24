// api/pass/pass.controller.js

var Pass = require('../../models/Pass')
var util = require('../../utils/util')

exports.newPass = (req,res) => {
  var payload = {userId:"test",marketId:"test",money:10000}

  var onSuccess = (pass) => {
    console.log(util.successTrue(pass))
  }

  var onError = (error) => {
    console.error(util.successFalse(error,"ERROR!"))
  }

  Pass.createPass(payload)
  .then(onSuccess)
  .catch(onError)
  res.send("New Pass")
}

exports.getPass = (req,res) => {
  var id = "5b80913cbc2cf24e6dbdffd9"

  var onSuccess = (pass) => {
    console.log(pass)
  }

  var onError = (error) => {
    console.error(error)
  }

  Pass.findOneById(id)
  .then(onSuccess)
  .catch(onError)

  res.send("Get Pass")
}

exports.getPassList = (req,res) => {
  res.send("Get Pass List")
}

exports.delPass = (req,res) => {
  res.send("Delete Pass")
}
