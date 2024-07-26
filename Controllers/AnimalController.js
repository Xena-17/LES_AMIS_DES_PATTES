const AnimalService = require('../Services/AnimalService');

class AnimalController {

    async getAllAnimal(request, result){
        try {
            const animal = await AnimalService.getAllAnimal();
            result.json(animal);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération des animaux"})
        }
    }

    async getAnimalByID(request, result){
        try {
           const animal = await AnimalService.getAnimalByID(request.params.AnimalID)
           result.json(animal);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération de l'animal"})
        }
    }

    async addAnimal(request, result){
        try {
            const animal = await UserService.addAnimal(request.body);
            result.json(animal);
        } catch (error) {
            result.status(500);
            
            result.json({error : "Une erreur est survenue lors de l'ajout d'un animal'"})
        }
    }

    async updateAnimal(request, result){
        try {
            const animal = await AnimalService.updateAnimal(request.params.id, request.body)
            result.json(animal);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la modification de l'animal"})
        }
    }

    async deleteAnimal(request, result){
        try {
            const animal = await UserAnimal.deleteAnimal(request.params.id);
            result.json(animal);
        } catch (error) {
            result.status(500);
            console.log(error);
            result.json({error : "Une erreur est survenue lors de la suppresion de l'animal"})
        }
    }

}

module.exports = new AnimalController();