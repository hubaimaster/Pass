//models/User.js

var mongoose = require('mongoose')
var uuid = require('node-uuid')
var bcrypt = require('bcrypt-nodejs')

var userSchema = mongoose.Schema({
  _id:{
    type:String,
    default:uuid.v4
  },
  password:{
    type:String,
    require:true
  },
  email:{
    type:String,
    require:true,
    unique:true
  },
  group:{
    type:String
  },
  money:{
    type:Number,
    default:0
  },
  creationDate:{
    type:Number,
    default:new Date().getTime()
  }
})

// create a new pass
userSchema.statics.createUser = function(payload){
  console.log("created new user")

  var user = new this(payload)

  return user.save()
}

// find one pass
userSchema.statics.findOneByEmail = function(email){
  console.log("Searching an user",email)

  return this.findOne({email})
}

userSchema.methods.reloadMoney = function(userId,amount){
  console.log("Reload money",userId,amount)

  return this.findOneAndUpdate({_id:userId},{$inc:{money:amount}},{new:true})
}

// authentication
userSchema.methods.authenticate = function(password){
	console.log('Authenticating a password')

	var user = this
	return bcrypt.compareSync(password,user.password)
}

userSchema.pre('save',function(next){
	var user = this
	if(!user.isModified('password')){
		next()
	} else {
		user.password = bcrypt.hashSync(user.password)
		next()
	}
})

var User = mongoose.model("user",userSchema)

module.exports = User
