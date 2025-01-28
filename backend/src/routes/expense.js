const express = require("express");
const router = express.Router()
router.get("/",(req,res)=>{
    res.send("hello world")
})
router.post("/",(req,res)=>{
    const {amount,category,date,note} = req.body
    res.send({
        "data": req.body,
        "status":"success"
    })
})
module.exports = router