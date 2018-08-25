// api/pass/pass.controller.js

var Pass = require('../../models/Pass')
var util = require('../../utils/util')

// POST
// create new pass.
exports.newPass = (req,res) => {
  var payload = req.body

  var onSuccess = (pass) => {
    console.log(pass)
    res.status(200).json(util.successTrue(pass))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  Pass.createPass(payload)
  .then(onSuccess)
  .catch(onError)
}

// GET
// get a pass object.
exports.getPass = (req,res) => {
  var id = req.param.passId

  var onSuccess = (pass) => {
    console.log(pass)
    res.status(200).json(util.successTrue(pass))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  Pass.findOneById(id)
  .then(onSuccess)
  .catch(onError)
}

 // PATCH
 // get a list of pass that is sorted by date.
exports.getPassList = (req,res) => {
  var marketId = req.body.marketId

  var onSuccess = (passes) => {
    passes.forEach(util.listPacking)
    console.log(passes)
    res.status(200).json(util.successTrue(passes))
  }

  var onError = (error) => {
    console.error(error)
    res.status(400).json(util.successFalse(error))
  }

  Pass.findListByMarketId(marketId)
  .then(onSuccess)
  .catch(onError)
}

// DELETE
// delete a pass with passid.
exports.delPass = (req,res) => {
  var id = req.body.passId

  var onSuccess = (result) => {
    console.log(result)
    res.status(200).json(util.successTrue())
  }

  var onError = (error) => {
    console.error(onError)
    res.status(400).json(util.successFalse(error))
  }

  Pass.deleteOneById(id)
  .then(onSuccess)
  .catch(onError)
}
