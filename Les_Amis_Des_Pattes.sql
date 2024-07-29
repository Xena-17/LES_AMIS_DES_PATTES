create database LAP;
use LAP;

CREATE TABLE Users(
   US_ID INT(10) NOT NULL AUTO_INCREMENT,
   US_Name VARCHAR(255) NOT NULL,
   US_First_Name VARCHAR(255) NOT NULL,
   US_Address VARCHAR(255) NOT NULL,
   US_Postcode VARCHAR(5) NOT NULL,
   US_City VARCHAR(255) NOT NULL,
   US_Phone CHAR(13) NOT NULL,
   US_Email VARCHAR(255) NOT NULL,
   US_Role VARCHAR(50),
   PRIMARY KEY(US_ID),
   UNIQUE(US_Phone),
   UNIQUE(US_Email)
);



CREATE TABLE Animals(
   AN_ID INT(10) NOT NULL AUTO_INCREMENT,
   AN_Name VARCHAR(150) NOT NULL,
   AN_Specie VARCHAR(50) NOT NULL,
   AN_Breed VARCHAR(150) NOT NULL,
   AN_Age DECIMAL(5,1) NOT NULL,
   AN_Medical_History boolean NOT NULL,
   US_ID INT(10) NOT NULL,
   PRIMARY KEY(AN_ID),
   FOREIGN KEY(US_ID) REFERENCES Users(US_ID)
);

CREATE TABLE Pet_Sitters(
   PS_ID INT(10) NOT NULL AUTO_INCREMENT,
   PS_Description VARCHAR(500) NOT NULL,
   PS_Experience VARCHAR(500) NOT NULL,
   PS_Hourly_Rate DECIMAL(10,2) NOT NULL,
   PS_Availability DATE NOT NULL,
   US_ID INT(10) NOT NULL,
   PRIMARY KEY(PS_ID),
   UNIQUE(PS_Description),
   UNIQUE(PS_Experience),
   FOREIGN KEY(US_ID) REFERENCES Users(US_ID)
);

CREATE TABLE Payments(
   PA_ID INT(50) NOT NULL AUTO_INCREMENT ,
   PA_Date DATE NOT NULL,
   PA_Total_Price DECIMAL(10,2) NOT NULL,
   PA_Type VARCHAR(50) NOT NULL,
   PA_Status VARCHAR(50) NOT NULL,
   PRIMARY KEY(PA_ID)
);

CREATE TABLE Reservations(
   RE_ID INT(10) NOT NULL AUTO_INCREMENT,
   RE_Start_Date DATE NOT NULL,
   RE_End_Date DATE NOT NULL,
   RE_Total_Price DECIMAL(10,2) NOT NULL,
   RE_Status VARCHAR(50) NOT NULL,
   PA_ID INT(50) NOT NULL,
   PS_ID INT(10) NOT NULL,
   US_ID INT(10) NOT NULL,
   PRIMARY KEY(RE_ID),
   UNIQUE(PA_ID),
   FOREIGN KEY(PA_ID) REFERENCES Payments(PA_ID),
   FOREIGN KEY(PS_ID) REFERENCES Pet_Sitters(PS_ID),
   FOREIGN KEY(US_ID) REFERENCES Users(US_ID)
);

INSERT INTO Users (US_ID, US_Name, US_First_Name, US_Address, US_Postcode, US_City, US_Phone, US_Email, US_Role) VALUES 
('001', 'Dupont', 'Jean', '12 rue de la Paix', '59930', 'La Chapelle d\'Armentières', '0320123456', 'jean.dupont@example.com', 'owner'),
('002', 'Martin', 'Lucie', '14 avenue des Fleurs', '59930', 'La Chapelle d\'Armentières', '0320789101', 'lucie.martin@example.com', 'owner'),
('003', 'Bernard', 'Sophie', '18 rue des Lilas', '59930', 'La Chapelle d\'Armentières', '0320123457', 'sophie.bernard@example.com', 'pet sitter'),
('004', 'Moreau', 'Pierre', '20 boulevard des Rosiers', '59930', 'La Chapelle d\'Armentières', '0320123458', 'pierre.moreau@example.com', 'owner'),
('005', 'Dubois', 'Claire', '22 rue des Champs', '59280', 'Armentières', '0320123459', 'claire.dubois@example.com', 'owner'),
('006', 'Leroy', 'Nicolas', '24 rue de la Gare', '59280', 'Armentières', '0320123460', 'nicolas.leroy@example.com', 'pet sitter'),
('007', 'Rousseau', 'Julie', '26 rue des Écoles', '59280', 'Armentières', '0320123461', 'julie.rousseau@example.com', 'owner'),
('008', 'Petit', 'David', '28 rue de la Liberté', '59280', 'Armentières', '0320123462', 'david.petit@example.com', 'pet sitter'),
('009', 'Girard', 'Emma', '30 rue des Frères', '59116', 'Houplines', '0622342222', 'emma.girard@example.com', 'owner'),
('010', 'Muller', 'Laura', '32 avenue de la République', '59116', 'Houplines', '0718181818', 'laura.muller@example.com', 'owner'),
('011', 'Blanc', 'Marcel', '34 rue du Moulin', '59116', 'Houplines', '0320123463', 'marcel.blanc@example.com', 'owner'),
('012', 'Fabre', 'Anne', '36 rue du Parc', '59116', 'Houplines', '0320123464', 'anne.fabre@example.com', 'owner'),
('013', 'Fontaine', 'Olivier', '38 rue des Jardins', '59160', 'Capinghem', '0320123465', 'olivier.fontaine@example.com', 'owner'),
('014', 'Gauthier', 'Camille', '40 rue de la Poste', '59116', 'Houplines', '0320123466', 'camille.gauthier@example.com', 'pet sitter'),
('015', 'Lambert', 'Luc', '42 rue de l\'Église', '59116', 'Houplines', '0320123467', 'luc.lambert@example.com', 'pet sitter'),
('016', 'Legrand', 'Paul', '44 avenue des Platanes', '59160', 'Capinghem', '0789012346', 'paul.legrand@example.com','owner'),
('017', 'Marchand', 'Nathalie', '46 rue des Peupliers', '59160', 'Capinghem', '0320123468', 'nathalie.marchand@example.com', 'owner'),
('018', 'Perrin', 'Jean-Paul', '48 rue du 8 Mai', '59930', 'La Chapelle d\'Armentières', '0320123469', 'jeanpaul.perrin@example.com', 'pet sitter'),
('019', 'Renard', 'Sandrine', '50 avenue des Cerisiers', '59160', 'Capinghem', '0320123470', 'sandrine.renard@example.com', 'owner'),
('020', 'Simon', 'Arnaud', '52 rue des Acacias', '59930', 'La Chapelle d\'Armentières', '0320123471', 'arnaud.simon@example.com', 'owner'),
('021', 'Thomas', 'Isabelle', '54 rue des Bleuets', '59930', 'La Chapelle d\'Armentières','0320123472', 'isabelle.thomas@example.com', 'owner'),
('022', 'Vidal', 'Michel', '56 avenue des Marronniers', '59280', 'Armentières', '0320123473', 'michel.vidal@example.com', 'owner'),
('023', 'Morel', 'Christine', '58 rue de la Fontaine', '59280', 'Armentières', '0667890125', 'christine.morel@example.com', 'pet sitter'),
('024', 'Garcia', 'Thierry', '60 rue de la Mairie', '59930', 'La Chapelle d\'Armentières', '0678901236', 'thierry.garcia@example.com', 'owner'),
('025', 'Roux', 'Patricia', '62 rue des Marguerites', '59930', 'La Chapelle d\'Armentières', '0678901234', 'patricia.roux@example.com', 'owner'),
('026', 'Clément', 'Hervé', '64 rue des Tulipes', 'B7783', 'Le Bizet', '0032944607165', 'herve.clement@example.com', 'pet sitter'),
('027', 'Chevalier', 'Marie', '66 avenue des Roses',  'B7783', 'Le Bizet', '0032944607166', 'marie.chevalier@example.com', 'owner'),
('028', 'Lopez', 'Antoine', '68 rue des Primevères', '59930', 'La Chapelle d\'Armentières', '0901234568', 'antoine.lopez@example.com', 'owner'),
('029', 'Mercier', 'Émilie', '70 rue des Coquelicots',  'B7783', 'Le Bizet', '0032944607167', 'emilie.mercier@example.com', 'owner'),
('030', 'Robin', 'Alain', '72 rue des Églantines', '59930', 'La Chapelle d\'Armentières', '0345678904', 'alain.robin@example.com', 'pet sitter');

SELECT * FROM users;
SELECT * FROM users WHERE US_ROLE="owner";
SELECT * FROM users WHERE US_ROLE="pet sitter";

INSERT INTO Animals (AN_ID, AN_Name, AN_Specie, AN_Breed, AN_Age, AN_Medical_History, US_ID) VALUES 
('001', 'Rex', 'Chien', 'Labrador', 5.0, TRUE, '001'),
('002', 'Mimi', 'Chat', 'Siamois', 3.0, FALSE, '002'),
('003', 'Titi', 'Oiseau', 'Canari', 2.0, FALSE, '004'),
('004', 'Bunny', 'Lapin', 'Nain', 1.5, TRUE, '004'),
('005', 'Goldie', 'Poisson', 'Rouge', 1.0, FALSE, '005'),
('006', 'Bella', 'Chien', 'Beagle', 4.0, TRUE, '005'),
('007', 'Fifi', 'Chat', 'Persan', 2.5, TRUE, '007'),
('008', 'Kiki', 'Oiseau', 'Perroquet', 3.5, FALSE, '009'),
('009', 'Fluffy', 'Lapin', 'Angora', 2.0, TRUE, '009'),
('010', 'Nemo', 'Poisson', 'Clown', 1.5, FALSE, '010'),
('011', 'Max', 'Chien', 'Golden Retriever', 6.0, FALSE, '011'),
('012', 'Chouchou', 'Chat', 'Maine Coon', 4.0, TRUE, '012'),
('013', 'Coco', 'Oiseau', 'Perruche', 1.0, FALSE, '013'),
('014', 'Thumper', 'Lapin', 'Holland Lop', 3.0, TRUE, '016'),
('015', 'Bubbles', 'Poisson', 'Betta', 2.0, FALSE, '016'),
('016', 'Charlie', 'Chien', 'Bulldog', 5.5, TRUE, '016'),
('017', 'Luna', 'Chat', 'British Shorthair', 3.5, TRUE, '017'),
('018', 'Polly', 'Oiseau', 'Cockatiel', 2.5, FALSE, '019'),
('019', 'Snowball', 'Lapin', 'Lionhead', 4.0, TRUE, '019'),
('020', 'Dory', 'Poisson', 'Tang', 1.5, FALSE, '020'),
('021', 'Rocky', 'Chien', 'Rottweiler', 7.0, TRUE, '021'),
('022', 'Whiskers', 'Chat', 'Sphynx', 3.0, TRUE, '022'),
('023', 'Tweety', 'Oiseau', 'Lovebird', 1.5, FALSE, '024'),
('024', 'Peter', 'Lapin', 'Mini Rex', 2.5, TRUE, '024'),
('025', 'Splash', 'Poisson', 'Guppy', 1.0, FALSE, '025'),
('026', 'Zeus', 'Chien', 'Doberman', 6.5, TRUE, '025'),
('027', 'Misty', 'Chat', 'Ragdoll', 4.5, TRUE, '027'),
('028', 'Kiwi', 'Oiseau', 'Conure', 2.0, FALSE, '028'),
('029', 'Hopper', 'Lapin', 'Dutch', 3.0, TRUE, '029'),
('030', 'Finny', 'Poisson', 'Catfish', 1.5, FALSE, '029');

SELECT * FROM Animals;

INSERT INTO Pet_Sitters (PS_ID, PS_Description, PS_Experience, PS_Hourly_Rate, PS_Availability, US_ID) VALUES 
('001', 'Pet sitter expérimentée, aime les animaux et les promenades en plein air.', '5 ans d\'expérience avec divers animaux.', 15.50, '2024-08-01', '003'),
('003', 'Retraité, beaucoup de temps libre pour s\'occuper de vos animaux.', '3 ans d\'expérience en tant que pet sitter.', 10.00, '2024-08-10', '006'),
('004', 'Aime les animaux, disponible tous les jours de la semaine.', '4 ans d\'expérience avec des chiens et des chats.', 14.00, '2024-08-15', '008'),
('005', 'Amoureuse des animaux exotiques, spécialiste des NAC.', '6 ans d\'expérience avec des reptiles et des oiseaux.', 18.00, '2024-08-20', '014'),
('006', 'Étudiant, adore les chiens et disponible en soirée.', '1 an d\'expérience avec les chiens.', 11.50, '2024-08-25', '015'),
('007', 'Passionné des chats, disponible le matin.', '2 ans d\'expérience avec les chats.', 13.00, '2024-08-30', '018'),
('008', 'Retraitée, aime prendre soin des animaux de compagnie.', '4 ans d\'expérience avec divers animaux.', 9.50, '2024-09-01', '023'),
('009', 'Éducateur canin certifié, disponible le weekend.', '5 ans d\'expérience avec des chiens de toutes races.', 17.00, '2024-09-05', '026'),
('002', 'Expérience en soins de santé des animaux, disponible en soirée.', '4 ans d\'expérience en clinique vétérinaire.', 14.50, '2024-09-15', '030');

SELECT * FROM Pet_Sitters;

INSERT INTO Payments (PA_ID, PA_Date, PA_Total_Price, PA_Type, PA_Status) VALUES 
('001', '2024-07-01', 150.00, 'Credit Card', 'Confirmed'),
('002', '2024-07-05', 120.00, 'Paypal', 'Pending'),
('003', '2024-07-10', 180.00, 'Payment by transfer', 'Executed'),
('004', '2024-07-15', 200.00, 'Credit Card', 'Cancelled'),
('005', '2024-07-20', 100.00, 'Paypal', 'Confirmed'),
('006', '2024-07-25', 90.00, 'Credit Card', 'Confirmed'),
('007', '2024-07-30', 110.00, 'Paypal', 'Pending'),
('008', '2024-08-01', 130.00, 'Payment by transfer', 'Executed'),
('009', '2024-08-05', 140.00, 'Credit Card', 'Cancelled'),
('010', '2024-08-10', 160.00, 'Paypal', 'Confirmed'),
('011', '2024-08-15', 170.00, 'Credit Card', 'Pending'),
('012', '2024-08-20', 190.00, 'Paypal', 'Executed'),
('013', '2024-08-25', 210.00, 'Payment by transfer', 'Cancelled'),
('014', '2024-08-30', 220.00, 'Credit Card', 'Confirmed'),
('015', '2024-09-01', 230.00, 'Paypal', 'Pending');

SELECT * FROM Payments;

INSERT INTO Reservations (RE_ID, RE_Start_Date, RE_End_Date, RE_Total_Price, RE_Status, PA_ID, PS_ID, US_ID) VALUES 
('001', '2024-08-01', '2024-08-07', 150.00, 'confirmed', '001', '001', '001'),
('002', '2024-08-05', '2024-08-10', 120.00, 'pending', '002', '002', '002'),
('003', '2024-08-10', '2024-08-15', 180.00, 'completed', '003', '003', '004'),
('004', '2024-08-15', '2024-08-20', 200.00, 'cancelled', '004', '004', '005'),
('005', '2024-08-20', '2024-08-25', 100.00, 'confirmed', '005', '005', '007'),
('006', '2024-08-25', '2024-08-30', 90.00, 'confirmed', '006', '006', '009'),
('007', '2024-08-30', '2024-09-05', 110.00, 'pending', '007', '007', '010'),
('008', '2024-09-01', '2024-09-07', 130.00, 'completed', '008', '008', '011'),
('009', '2024-09-05', '2024-09-10', 140.00, 'cancelled', '009', '009', '012'),
('010', '2024-09-10', '2024-09-15', 160.00, 'confirmed', '010', '001', '013'),
('011', '2024-09-15', '2024-09-20', 170.00, 'pending', '011', '004', '016'),
('012', '2024-09-20', '2024-09-25', 190.00, 'completed', '012', '002', '017'),
('013', '2024-09-25', '2024-09-30', 210.00, 'cancelled', '013', '009', '019'),
('014', '2024-09-30', '2024-10-05', 220.00, 'confirmed', '014', '003', '020'),
('015', '2024-10-01', '2024-10-07', 230.00, 'pending', '015', '001', '021');

SELECT * FROM Reservations;









