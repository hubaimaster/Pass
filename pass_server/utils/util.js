// utils/util.js

var util = {}

util.successTrue = (data) => {
  return {
    success:true,
    message:null,
    error:null,
    data:data
  }
}

util.successFalse = (error,message) => {
  return {
    success:false,
    message:message,
    error:error,
    data:null
  }
}

module.exports = util
