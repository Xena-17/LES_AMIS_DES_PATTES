// Importation du modèle Reservation depuis le fichier des modèles
const Reservation = require('../Models/Reservation');


// Déclaration de la classe ReservationService qui contient les méthodes de gestion des réservations
class ReservationService {
// Méthode pour récupérer toutes les réservations depuis la base de données
    async getAllReservation(){
         // Utilise la méthode findAll() de Sequelize pour obtenir toutes les réservations
        return await Reservation.findAll();
    }
// Méthode pour récupérer une réservation spécifique en fonction de son ID
    async getReservationByID(ReservationId){
         // Utilise la méthode findByPk() de Sequelize pour trouver une réservation par sa clé primaire (ID)
        return await Reservation.findByPk(ReservationId);
    }
 // Méthode pour ajouter une nouvelle réservation à la base de données
    async addReservation(reservation){
        // Utilise la méthode create() de Sequelize pour insérer une nouvelle réservation dans la base de données
        return await Reservation.create(reservation)
    }
// Méthode pour mettre à jour une réservation existante
    async updateReservation(id, reservation){
         // Utilise la méthode update() de Sequelize pour modifier une réservation en fonction de son ID
        // La mise à jour se fait en appliquant les nouvelles données de "reservation" aux enregistrements où RE_ID correspond à l'ID fourni
        return await Reservation.update(reservation, {
            where : {
                RE_ID : id // Condition pour cibler la réservation à mettre à jour en fonction de son ID
            }
        })
    }
// Méthode pour supprimer une réservation en fonction de son ID
    async deleteReservation(id){
        // Utilise la méthode destroy() de Sequelize pour supprimer la réservation où l'ID correspond à l'ID fourni
        return await Reservation.destroy({where : {RE_ID : id}})
    }
}
// Exportation d'une nouvelle instance de ReservationService pour pouvoir utiliser ce service dans d'autres parties de l'application
module.exports = new ReservationService();