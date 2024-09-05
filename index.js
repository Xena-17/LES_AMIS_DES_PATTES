const express = require('express');
const cors = require('cors');
const app = express();
const port = 3001;
const userRoute= require('./Routes/UserRoute');
const animalRoute = require('./Routes/AnimalRoute'); 
const petsitterRoute = require('./Routes/PetSitterRoute'); 
const paymentRoute = require('./Routes/PaymentRoute');
const reservationRoute = require('./Routes/ReservationRoute');
const AuthenticateController = require('./Controllers/AuthenticateController');

// Précise que notre API fonctionne avec des fichiers JSON
app.use(express.json());
// 5 Types de requêtes possible => GET, POST, PATCH, DELETE, PUT 
app.use(cors());
// Premier parametre est la route pour acceder aux données
// Deuxieme parametre est la fonction fléchée qui va faire le traitement, prend toujours deux parametres (request, result)
app.get('/hello', (request, result) => {
    // Envoie les données a l'utilisateur
    result.send('Hello World !!');
})
 // Ajoute les routes pour les utilisateurs
app.use('/users', userRoute);
app.use('/animals',AuthenticateController.authenticateToken, animalRoute);
app.use('/petsitters',AuthenticateController.authenticateToken, petsitterRoute);
app.use('/payments',AuthenticateController.authenticateToken, paymentRoute);
app.use('/reservations',AuthenticateController.authenticateToken, reservationRoute);




// Premier parametre le port sur lequel le server va écouter les données
// Deuxieme parametre une fonction fléchée qui est faite au lancement uniquement du serveur
app.listen(port, () => {
    console.log("Votre Serveur est lancé sur http://127.0.0.1:"+port);
})
