const express = require('express');
const PaymentController = require('../Controllers/PaymentController');
// Constante pour pouvoir specifier des routes
const router = express.Router();
// Toutes les routes seront précédés par /Users

router.get("/", (request, result) => {PaymentController.getAllPayment(request, result)});
router.get("/:PaymentID", (request, result) => {PaymentController.getPaymentByID(request, result)});
router.post("/", (request, result) =>{PaymentController.addPayment(request,result)});
router.patch("/:id", (request, result) => {PaymentController.updatePayment(request,result)});
router.delete("/:id", (request, result) => {PaymentController.deletePayment(request,result)});

module.exports = router;