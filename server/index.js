const express=require("express");
const mongoose=require("mongoose");
const authRouter = require("./router/auth");
const bcryptjs = require('bcryptjs');

const PORT=process.env.PORT||5000;
const app=express();


app.use(express.json());
app.use(authRouter);
const DB="mongodb+srv://yuvhendram:Prabhat5617@cluster0.vojxl1i.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(DB).then(()=>{
    console.log("connected to the database");
})
.catch((e)=>{
    console.error("could not connect", e);
});
const cors =require('cors');

app.use(cors());
app.listen(PORT,()=>{console.log('listening on port',PORT);});