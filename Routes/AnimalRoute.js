const express = require('express');
const AnimalController = require('../Controllers/AnimalController');
// Constante pour pouvoir specifier des routes
const router = express.Router();
// Toutes les routes seront précédés par /Users

router.get("/", (request, result) => {AnimalController.getAllAnimal(request, result)});
router.get("/:AnimalID", (request, result) => {AnimalController.getAnimalByID(request, result)});
router.post("/", (request, result) =>{AnimalController.addAnimal(request,result)});
router.patch("/:id", (request, result) => {AnimalController.updateAnimal(request,result)});
router.delete("/:id", (request, result) => {AnimalController.deleteAnimal(request,result)});

module.exports = router;