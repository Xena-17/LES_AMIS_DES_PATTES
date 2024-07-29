const PetSitterService = require('../Services/PetSitterService');

class PetSittertController {

    async getAllPetSitter(request, result){
        try {
            const petSitter = await PetSitterService.getAllPetSitter();
            result.json(petSitter);
        } catch (error) {
            result.status(500);

            result.json({error : "Une erreur est survenue lors de la récupération des pets sitters"})
        }
    }

    async getPetSitterByID(request, result){
        try {
           const petSitter = await PetSitterService.getPetSitterByID(request.params.PetSitterID)
           result.json(petSitter);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération du Pet Sitter"})
        }
    }

    async addPetSitter(request, result){
        try {
            const petSitter = await PetSitterService.addPetSitter(request.body)
            result.json(petSitter);
        } catch (error) {
            result.status(500);
            console.log(error);
 
            result.json({error : "Une erreur est survenue lors de l'ajout d'un Pet Sitter"})
        }
    }

    async updatePetSitter(request, result){
        try {
            const petSitter = await PetSitterService.updatePetSitter(request.params.id, request.body)
            result.json(petSitter);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la modification du Pet Sitter"})
        }
    }

    async deletePetSitter(request, result){
        try {
            const petSitter = await PetSitterService.deletePetSitter(request.params.id);
            result.json(petSitter);
        } catch (error) {
            result.status(500);
  
            result.json({error : "Une erreur est survenue lors de la suppresion du Pet Sitter"})
        }
    }

}

module.exports = new PetSittertController();