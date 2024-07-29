const PaymentService = require('../Services/PaymentService');

class PaymentController {

    async getAllPayment(request, result){
        try {
            const payment = await PaymentService.getAllPayment();
            result.json(payment);
        } catch (error) {
            result.status(500);

            result.json({error : "Une erreur est survenue lors de la récupération du paiement"})
        }
    }

    async getPaymentByID(request, result){
        try {
           const payment = await PaymentService.getPaymentByID(request.params.PaymentID)
           result.json(payment);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la récupération du paiement"})
        }
    }

    async addPayment(request, result){
        try {
            const payment = await PaymentService.addPayment(request.body)
            result.json(payment);
        } catch (error) {
            result.status(500);
    
            result.json({error : "Une erreur est survenue lors de l'ajout d'un paiement"})
        }
    }

    async updatePayment(request, result){
        try {
            const payment = await PaymentService.updatePayment(request.params.id, request.body)
            result.json(payment);
        } catch (error) {
            result.status(500);
            result.json({error : "Une erreur est survenue lors de la modification du paiement"})
        }
    }

    async deletePayment(request, result){
        try {
            const payment = await PaymentService.deletePayment(request.params.id);
            result.json(payment);
        } catch (error) {
            result.status(500);

            result.json({error : "Une erreur est survenue lors de la suppresion du paiement"})
        }
    }
}


module.exports = new PaymentController();