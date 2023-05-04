import express, { Request, Response } from 'express'
import cors from 'cors'
import { UserController } from './controller/UseController'
import { AccountController } from './controller/AccountController'

const app = express()

app.use(cors())
app.use(express.json())

app.listen(3003, () => {
    console.log(`Servidor rodando na porta ${3003}`)
})


const userController = new UserController()
const accountController = new AccountController()



app.get("/users", userController.getUsers)

app.post("/users", userController.createUser)

app.put("/accounts/:id/balance",  accountController.editBalanceById)

app.get("/accounts", accountController.getAccounts)

app.get("/accounts/:id/balance", accountController.getAccountsById)

app.post("/accounts", accountController.createAccount)

