const User = require('./Models/User');

class UserService {

    async getAllUser(){
        return await User.findAll();
    }

    async getUserByID(UserId){
        return await User.findByPk(UserId, {include : 'reservations'});
    }

    async addUser(User){
        return await User.create(User);
    }

    async updateUser(id, User){
        return await User.update(User, {
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


