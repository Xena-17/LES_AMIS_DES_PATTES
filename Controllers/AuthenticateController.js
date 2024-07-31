const jwt = require('jsonwebtoken');
const config = require('../Config/config.json');

class AuthenticateController{
    authenticateToken(request, result, next){
        // Verifier la validité des identifiants et les droits de l'utilisateur
        // Si les identifiants sont corrects et les droits sont suffisants, renvoyer un jeton d'authentification
        // Sinon, renvoyer une erreur
        const authHeader= request.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];
        if(!token) {
            result.status(401);
            return result.json({error : "Token manquant"})
        }
        jwt.verify(token, config.SECRET, (error, user) => {
            if (error) {
                result.status(401);
                return result.json({error : "Token invalide"})
            }
            request.user = user;
            next();
        })
    }

    generateToken(user){
        const payload = {
            id: user.US_ID,
            email : user.US_Email,
            user: user.US_Name + " " + user.US_First_Name
        }
        return jwt.sign(payload, config.SECRET, {expiresIn: '1h'})
    }
}

module.exports = new AuthenticateController();