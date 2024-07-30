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
            },
            individualHooks :true
        })
    }

    async deleteUser(id){
        return await User.destroy({where : {US_ID : id}})
    }
    async login(email,password){
        const user = await User.findOne({where : {US_Email : email}});
        if (!user || !await User.validatePassword(password)){
            throw new Error('Email ou password incorrect');
        }
        return user;
        
    }
}

module.exports = new UserService();


