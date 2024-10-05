const express = require("express");
const User = require("../models/user_model");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

const client = require("twilio")(accountSid, authToken);
const OTP = 1234;

authRouter.post("/api/signup/sendotp", async (req, res) => {
  try {
    const { name, email, age, school, password, currentposition, number } =
      req.body;

    const existingUserByEmail = await User.findOne({ email });
    if (existingUserByEmail) {
      return res
        .status(400)
        .json({ msg: "User with the same email already exists!" });
    }

    const existingUserByNumber = await User.findOne({ number });
    if (existingUserByNumber) {
      return res
        .status(400)
        .json({ msg: "User with the same phone number already exists!" });
    }

    res
      .status(200)
      .json({ msg: "Use 1234 as a otp for verification for now " });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// function generateOTP() {
//     let digits = "0123456789";
//     let OTP = "";
//     for (let i = 0; i < 4; i++) {
//         OTP += digits[Math.floor(Math.random() * 10)];
//     }
//     return OTP;
// }
// async function sendOTP(number, OTP) {
//     try {
//         await client.messages.create({
//             body: Your OTP for signup is: ${OTP},
//             from: '+19284823030',
//             to: number
//         });
//     } catch (error) {
//         console.error("Error sending OTP: ", error);
//         throw error;
//     }
// }
authRouter.post("/api/signup/verifyotp", async (req, res) => {
  try {
    const { name, email, age, school, password, currentposition, number, otp } =
      req.body;

    if (otp != OTP) {
      return res.status(400).json({ msg: "Incorrect OTP" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let newUser = new User({
      email,
      password: hashedPassword,
      name,
      age,
      school,
      currentposition,
      number,
    });

    newUser = await newUser.save();

    OTP = "1234";

    res.status(200).json(newUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// authRouter.post("/api/signup", async(req,res)=>{
//     try{
//         const {name,email,age,school,password,currentposition,number}=req.body;
//         const existingUser=await User.findOne({email});
//         if(existingUser){
//             return res.status(400)
//             .json({msg:"User with same email already exists!"});
//         }
//         const existingUserByNumber = await User.findOne({ number });
//         if (existingUserByNumber) {
//             return res.status(400).json({ msg: "User with the same phone number already exists!" });
//         }
//         const hashedPassword=await bcryptjs.hash(password,8);
//         let user=new User({
//             email,
//             password:hashedPassword,
//             name,
//             age,
//             school,
//             currentposition,
//             number,
//         });
//         user=await user.save();
//         res.json(user);
//     }
//     catch(e){
// res.status(500).json({error:e.message});
//     }
// });
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email alraedy exists " });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
