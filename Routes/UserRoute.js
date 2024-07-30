const express = require('express');
const UserController = require('../Controllers/UserController');
// Constante pour pouvoir specifier des routes
const router = express.Router();
// Toutes les routes seront précédés par /Users

router.get("/", (request, result) => {UserController.getAllUser(request, result)});
router.get("/:UserID", (request, result) => {UserController.getUserByID(request, result)});
router.post("/", (request, result) =>{UserController.addUser(request,result)});
router.patch("/:id", (request, result) => {UserController.updateUser(request,result)});
router.delete("/:id", (request, result) => {UserController.deleteUser(request,result)});
router.post('/login', (request, result) => {UserController.login(request, result)});

module.exports = router;