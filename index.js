const express = require('express');
const cors = require('cors');
const app = express();
const port = 3001;
const userRoute= require('./Routes/UserRoute'); 

// Précise que notre API fonctionne avec des fichiers JSON
app.use(express.json());
// 5 Types de requêtes possible => GET, POST, PATCH, DELETE, PUT 
app.use(cors());
// Premier parametre est la route pour acceder aux données
// Deuxieme parametre est la fonction fléchée qui va faire le traitement, prend toujours deux parametres (request, result)
app.get('/hello', (request, result) => {
    // Envoie les donnée a l'utilisateur
    result.send('Hello World !!');
})
 // Ajoute les routes pour les utilisateurs
app.use('/users', userRoute);



// Premier parametre le port sur lequel le server va écouter les données
// Deuxieme parametre une fonction fléchée qui est faite au lancement uniquement du serveur
app.listen(port, () => {
    console.log("Votre Serveur est lancé sur http://127.0.0.1:"+port);
})
