const UserService = require('../Services/UserService');

class UserController {

    async getAllUser(request, result){
        try {
            const Users = await UserService.getAllUser();
            result.json(Users);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération des utilisateurs"})
        }
    }

    async getUserByID(request, result){
        try {
           const user = await UserService.getUserByID(request.params.UserID)
           result.json(user);
        } catch (error) {
            result.status(500);

            result.json({error : "Une erreur est survenue lors de la récupération de l'utilisateur"})
        }
    }

    async addUser(request, result){
        try {
            const user = await UserService.addUser(request.body);
            result.json(user);
        } catch (error) {
            result.status(500);
            console.log(error);
            
            result.json({error : "Une erreur est survenue lors de l'ajout d'un utilisateur'"})
        }
    }

    async updateUser(request, result){
        try {
            const user = await UserService.updateUser(request.params.id, request.body)
            result.json(user);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la modification de l'utilisateur"})
        }
    }

    async deleteUser(request, result){
        try {
            const user = await UserService.deleteUser(request.params.id);
            result.json(user);
        } catch (error) {
            result.status(500);
 
            result.json({error : "Une erreur est survenue lors de la suppresion de l'utilisateur"})
        }
    }
    async login(request, result) {
        try {
            // Destructuration du password
            const {email, password} = request.body;
            const user = await UserService.login(email, password);
            result.json(user);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la connexion de l'utilisateur"})
        }
    }

}

module.exports = new UserController();