const ReservationService = require('../Services/ReservationService');

class ReservationController {

    async getAllReservation(request, result){
        try {
            const Reservations = await ReservationService.getAllReservation();
            result.json(Reservations);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération des réservations"})
        }
    }

    async getReservationByID(request, result){
        try {
           const reservation = await ReservationService.getReservationByID(request.params.ReservationID)
           result.json(reservation);
        } catch (error) {
            result.status(500);

            result.json({error : "Une erreur est survenue lors de la récupération de la réservation"})
        }
    }

    async addReservation(request, result){
        try {
            const reservation = await ReservationService.addReservation(request.body);
            result.json(reservation);
        } catch (error) {
            result.status(500);
            
            result.json({error : "Une erreur est survenue lors de l'ajout d'une réservation"})
        }
    }

    async updateReservation(request, result){
        try {
            const reservation = await ReservationService.updateReservation(request.params.id, request.body)
            result.json(reservation);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la modification d'une réservation'"})
        }
    }

    async deleteReservation(request, result){
        try {
            const reservation = await ReservationService.deleteReservation(request.params.id);
            result.json(reservation);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la suppresion de la réservation"})
        }
    }

}

module.exports = new ReservationController();