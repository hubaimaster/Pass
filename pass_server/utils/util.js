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
  if(!error && !meesage) message = 'data not found';
  return {
    success:false,
    message:message,
    error:error,
    data:null
  }
}

util.listPacking = (item,index,arr) => {
  arr[index] = {"data":item}
}

module.exports = util
