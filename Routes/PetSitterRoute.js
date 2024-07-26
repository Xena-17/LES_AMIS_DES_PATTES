const express = require('express');
const PetSitterController = require('../Controllers/PetSitterController');
// Constante pour pouvoir specifier des routes
const router = express.Router();
// Toutes les routes seront précédés par /Users

router.get("/", (request, result) => {PetSitterController.getAllPetSitter(request, result)});
router.get("/:AnimalID", (request, result) => {PetSitterController.getPetSitterByID(request, result)});
router.post("/", (request, result) =>{PetSitterController.addPetSitter(request,result)});
router.patch("/:id", (request, result) => {PetSitterController.updatePetSitter(request,result)});
router.delete("/:id", (request, result) => {PetSitterController.deletePetSitter(request,result)});

module.exports = router;