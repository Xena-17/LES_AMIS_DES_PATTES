const PetSitter = require('../Models/PetSitter');



class PetSitterService {

    async getAllPetSitter(){
        return await PetSitter.findAll();
    }

    async getPetSitterByID(PetSitterId){
        return await PetSitter.findByPk(PetSitterId);
    }

    async addPetSitter(petsitter){
        return await PetSitter.create(petsitter)
    }

    async updatePetSitter(id, petsitter){
        return await PetSitter.update(petsitter, {
            where : {
                PS_ID : id
            }
        })
    }

    async deletePetSitter(id){
        return await PetSitter.destroy({where : {PS_ID : id}})
    }
}

module.exports = new PetSitterService();