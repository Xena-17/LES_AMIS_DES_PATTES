const Animal = require('../Models/Animal');



class AnimalService {

    async getAllAnimal(){
        return await Animal.findAll();
    }

    async getAnimalByID(AnimalId){
        return await Animal.findByPk(AnimalId);
    }

    async addAnimal(animal){
        return await Animal.create(animal)
    }

    async updateAnimal(id, animal){
        return await Animal.update(animal, {
            where : {
                AN_ID : id
            }
        })
    }

    async deleteAnimal(id){
        return await Animal.destroy({where : {AN_ID : id}})
    }
}

module.exports = new AnimalService();
