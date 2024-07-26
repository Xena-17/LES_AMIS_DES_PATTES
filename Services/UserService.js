const User = require('../Models/User');



class UserService {

    async getAllUser(){
        return await User.findAll();
    }

    async getUserByID(UserId){
        return await User.findByPk(UserId);
    }

    async addUser(user){
        return await User.create(user)
    }

    async updateUser(id, user){
        return await User.update(user, {
            where : {
                US_ID : id
            }
        })
    }

    async deleteUser(id){
        return await User.destroy({where : {US_ID : id}})
    }
}

module.exports = new UserService();


