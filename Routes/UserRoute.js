const express = require('express');
const UserController = require('../Controllers/UserController');
const AuthenticateController = require('../Controllers/AuthenticateController');
// Constante pour pouvoir specifier des routes
const router = express.Router();
// Toutes les routes seront précédés par /Users

router.get("/",AuthenticateController.authenticateToken, (request, result) => {UserController.getAllUser(request, result)});
router.get("/:UserID", AuthenticateController.authenticateToken, (request, result) => {UserController.getUserByID(request, result)});
router.post("/", AuthenticateController.authenticateToken, (request, result) =>{UserController.addUser(request,result)});
router.patch("/:id", AuthenticateController.authenticateToken, (request, result) => {UserController.updateUser(request,result)});
router.delete("/:id",AuthenticateController.authenticateToken,  (request, result) => {UserController.deleteUser(request,result)});
router.post('/login', (request, result) => {UserController.login(request, result)});

module.exports = router;