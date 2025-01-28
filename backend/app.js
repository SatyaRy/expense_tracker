
const express = require("express")
const app = express()
const port = 3000
const expenseRoute = require("./src/routes/expense.js")
app.use(express.json())
app.use("/expense",expenseRoute)



try {
    app.listen(port,()=>{
        console.log(`server is running on port ${port}`)
    })
} catch (error) {
    console.log(error)
}