const express = require('express');
const ReservationController = require('../Controllers/ReservationController');
// Constante pour pouvoir specifier des routes
const router = express.Router();
// Toutes les routes seront précédés par /Users

router.get("/", (request, result) => {ReservationController.getAllReservation(request, result)});
router.get("/:ReservationID", (request, result) => {ReservationController.getReservationByID(request, result)});
router.post("/", (request, result) =>{ReservationController.addReservation(request,result)});
router.patch("/:id", (request, result) => {ReservationController.updateReservation(request,result)});
router.delete("/:id", (request, result) => {ReservationController.deleteReservation(request,result)});

module.exports = router;