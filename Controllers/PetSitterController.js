const PetSitterService = require('../Services/PetSitterService');

class PetSittertController {

    async getAllPetSitter(request, result){
        try {
            const petsitter = await PetSitterService.getAllPetSitter();
            result.json(petsitter);
        } catch (error) {
            result.status(500);

            result.json({error : "Une erreur est survenue lors de la récupération des pets sitters"})
        }
    }

    async getPetSitterByID(request, result){
        try {
           const petsitter = await PetSitterService.getPetSitterByID(request.params.PetSitterID)
           result.json(petsitter);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération du Pet Sitter"})
        }
    }

    async addPetSitter(request, result){
        try {
            const petsitter = await PetSitterService.addPetSitterl(request.body)
            result.json(petsitter);
        } catch (error) {
            result.status(500);
 
            result.json({error : "Une erreur est survenue lors de l'ajout d'un Pet Sitter"})
        }
    }

    async updatePetSitter(request, result){
        try {
            const petsitter = await PetSitterService.updatePetSitter(request.params.id, request.body)
            result.json(petsitter);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la modification du Pet Sitter"})
        }
    }

    async deletePetSitter(request, result){
        try {
            const animal = await PetSitterService.deletePetSitter(request.params.id);
            result.json(petsitter);
        } catch (error) {
            result.status(500);
  
            result.json({error : "Une erreur est survenue lors de la suppresion du Pet Sitter"})
        }
    }

}

module.exports = new PetSittertController();