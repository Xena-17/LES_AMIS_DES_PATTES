const Payment = require('../Models/Payment');



class PaymentService {

    async getAllPayment(){
        return await Payment.findAll();
    }

    async getPaymentByID(PaymentId){
        return await Payment.findByPk(PaymentId);
    }

    async addPayment(payment){
        return await Payment.create(payment)
    }

    async updatePayment(id, payment){
        return await Payment.update(payment, {
            where : {
                PA_ID : id
            }
        })
    }

    async deletePayment(id){
        return await Payment.destroy({where : {PA_ID : id}})
    }
}

module.exports = new PaymentService();