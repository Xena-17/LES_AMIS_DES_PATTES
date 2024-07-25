create database LAP;
use LAP;

CREATE TABLE Users(
   US_ID VARCHAR(10),
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
   AN_ID VARCHAR(10),
   AN_Name VARCHAR(150) NOT NULL,
   AN_Specie VARCHAR(50) NOT NULL,
   AN_Breed VARCHAR(150) NOT NULL,
   AN_Age DECIMAL(5,1) NOT NULL,
   AN_Medical_History boolean NOT NULL,
   US_ID VARCHAR(10) NOT NULL,
   PRIMARY KEY(AN_ID),
   FOREIGN KEY(US_ID) REFERENCES Users(US_ID)
);

CREATE TABLE Pet_Sitters(
   PS_ID VARCHAR(10),
   PS_Description VARCHAR(500) NOT NULL,
   PS_Experience VARCHAR(500) NOT NULL,
   PS_Hourly_Rate DECIMAL(10,2) NOT NULL,
   PS_Availability DATE NOT NULL,
   US_ID VARCHAR(10) NOT NULL,
   PRIMARY KEY(PS_ID),
   UNIQUE(PS_Description),
   UNIQUE(PS_Experience),
   FOREIGN KEY(US_ID) REFERENCES Users(US_ID)
);

CREATE TABLE Payments(
   PA_ID VARCHAR(50),
   PA_Date DATE NOT NULL,
   PA_Total_Price DECIMAL(10,2) NOT NULL,
   PA_Type VARCHAR(50) NOT NULL,
   PA_Status VARCHAR(50) NOT NULL,
   PRIMARY KEY(PA_ID)
);

CREATE TABLE Reservations(
   RE_ID VARCHAR(10),
   RE_Start_Date DATE NOT NULL,
   RE_End_Date DATE NOT NULL,
   RE_Total_Price DECIMAL(10,2) NOT NULL,
   RE_Status VARCHAR(50) NOT NULL,
   PA_ID VARCHAR(50) NOT NULL,
   PS_ID VARCHAR(10) NOT NULL,
   US_ID VARCHAR(10) NOT NULL,
   PRIMARY KEY(RE_ID),
   UNIQUE(PA_ID),
   FOREIGN KEY(PA_ID) REFERENCES Payments(PA_ID),
   FOREIGN KEY(PS_ID) REFERENCES Pet_Sitters(PS_ID),
   FOREIGN KEY(US_ID) REFERENCES Users(US_ID)
);

INSERT INTO Users (US_ID, US_Name, US_First_Name, US_Address, US_Postcode, US_City, US_Phone, US_Email, US_Role) VALUES 
('U001', 'Dupont', 'Jean', '12 rue de la Paix', '59930', 'La Chapelle d\'Armentières', '0320123456', 'jean.dupont@example.com', 'owner'),
('U002', 'Martin', 'Lucie', '14 avenue des Fleurs', '59930', 'La Chapelle d\'Armentières', '0320789101', 'lucie.martin@example.com', 'owner'),
('U003', 'Bernard', 'Sophie', '18 rue des Lilas', '59930', 'La Chapelle d\'Armentières', '0320123457', 'sophie.bernard@example.com', 'pet sitter'),
('U004', 'Moreau', 'Pierre', '20 boulevard des Rosiers', '59930', 'La Chapelle d\'Armentières', '0320123458', 'pierre.moreau@example.com', 'owner'),
('U005', 'Dubois', 'Claire', '22 rue des Champs', '59280', 'Armentières', '0320123459', 'claire.dubois@example.com', 'owner'),
('U006', 'Leroy', 'Nicolas', '24 rue de la Gare', '59280', 'Armentières', '0320123460', 'nicolas.leroy@example.com', 'pet sitter'),
('U007', 'Rousseau', 'Julie', '26 rue des Écoles', '59280', 'Armentières', '0320123461', 'julie.rousseau@example.com', 'owner'),
('U008', 'Petit', 'David', '28 rue de la Liberté', '59280', 'Armentières', '0320123462', 'david.petit@example.com', 'pet sitter'),
('U009', 'Girard', 'Emma', '30 rue des Frères', '59116', 'Houplines', '0622342222', 'emma.girard@example.com', 'owner'),
('U010', 'Muller', 'Laura', '32 avenue de la République', '59116', 'Houplines', '0718181818', 'laura.muller@example.com', 'owner'),
('U011', 'Blanc', 'Marcel', '34 rue du Moulin', '59116', 'Houplines', '0320123463', 'marcel.blanc@example.com', 'owner'),
('U012', 'Fabre', 'Anne', '36 rue du Parc', '59116', 'Houplines', '0320123464', 'anne.fabre@example.com', 'owner'),
('U013', 'Fontaine', 'Olivier', '38 rue des Jardins', '59160', 'Capinghem', '0320123465', 'olivier.fontaine@example.com', 'owner'),
('U014', 'Gauthier', 'Camille', '40 rue de la Poste', '59116', 'Houplines', '0320123466', 'camille.gauthier@example.com', 'pet sitter'),
('U015', 'Lambert', 'Luc', '42 rue de l\'Église', '59116', 'Houplines', '0320123467', 'luc.lambert@example.com', 'pet sitter'),
('U016', 'Legrand', 'Paul', '44 avenue des Platanes', '59160', 'Capinghem', '0789012346', 'paul.legrand@example.com','owner'),
('U017', 'Marchand', 'Nathalie', '46 rue des Peupliers', '59160', 'Capinghem', '0320123468', 'nathalie.marchand@example.com', 'owner'),
('U018', 'Perrin', 'Jean-Paul', '48 rue du 8 Mai', '59930', 'La Chapelle d\'Armentières', '0320123469', 'jeanpaul.perrin@example.com', 'pet sitter'),
('U019', 'Renard', 'Sandrine', '50 avenue des Cerisiers', '59160', 'Capinghem', '0320123470', 'sandrine.renard@example.com', 'owner'),
('U020', 'Simon', 'Arnaud', '52 rue des Acacias', '59930', 'La Chapelle d\'Armentières', '0320123471', 'arnaud.simon@example.com', 'owner'),
('U021', 'Thomas', 'Isabelle', '54 rue des Bleuets', '59930', 'La Chapelle d\'Armentières','0320123472', 'isabelle.thomas@example.com', 'owner'),
('U022', 'Vidal', 'Michel', '56 avenue des Marronniers', '59280', 'Armentières', '0320123473', 'michel.vidal@example.com', 'owner'),
('U023', 'Morel', 'Christine', '58 rue de la Fontaine', '59280', 'Armentières', '0667890125', 'christine.morel@example.com', 'pet sitter'),
('U024', 'Garcia', 'Thierry', '60 rue de la Mairie', '59930', 'La Chapelle d\'Armentières', '0678901236', 'thierry.garcia@example.com', 'owner'),
('U025', 'Roux', 'Patricia', '62 rue des Marguerites', '59930', 'La Chapelle d\'Armentières', '0678901234', 'patricia.roux@example.com', 'owner'),
('U026', 'Clément', 'Hervé', '64 rue des Tulipes', 'B7783', 'Le Bizet', '0032944607165', 'herve.clement@example.com', 'pet sitter'),
('U027', 'Chevalier', 'Marie', '66 avenue des Roses',  'B7783', 'Le Bizet', '0032944607166', 'marie.chevalier@example.com', 'owner'),
('U028', 'Lopez', 'Antoine', '68 rue des Primevères', '59930', 'La Chapelle d\'Armentières', '0901234568', 'antoine.lopez@example.com', 'owner'),
('U029', 'Mercier', 'Émilie', '70 rue des Coquelicots',  'B7783', 'Le Bizet', '0032944607167', 'emilie.mercier@example.com', 'owner'),
('U030', 'Robin', 'Alain', '72 rue des Églantines', '59930', 'La Chapelle d\'Armentières', '0345678904', 'alain.robin@example.com', 'pet sitter');

SELECT * FROM users;
SELECT * FROM users WHERE US_ROLE="owner";
SELECT * FROM users WHERE US_ROLE="pet sitter";

INSERT INTO Animals (AN_ID, AN_Name, AN_Specie, AN_Breed, AN_Age, AN_Medical_History, US_ID) VALUES 
('A001', 'Rex', 'Chien', 'Labrador', 5.0, TRUE, 'U001'),
('A002', 'Mimi', 'Chat', 'Siamois', 3.0, FALSE, 'U002'),
('A003', 'Titi', 'Oiseau', 'Canari', 2.0, FALSE, 'U004'),
('A004', 'Bunny', 'Lapin', 'Nain', 1.5, TRUE, 'U004'),
('A005', 'Goldie', 'Poisson', 'Rouge', 1.0, FALSE, 'U005'),
('A006', 'Bella', 'Chien', 'Beagle', 4.0, TRUE, 'U005'),
('A007', 'Fifi', 'Chat', 'Persan', 2.5, TRUE, 'U007'),
('A008', 'Kiki', 'Oiseau', 'Perroquet', 3.5, FALSE, 'U009'),
('A009', 'Fluffy', 'Lapin', 'Angora', 2.0, TRUE, 'U009'),
('A010', 'Nemo', 'Poisson', 'Clown', 1.5, FALSE, 'U010'),
('A011', 'Max', 'Chien', 'Golden Retriever', 6.0, FALSE, 'U011'),
('A012', 'Chouchou', 'Chat', 'Maine Coon', 4.0, TRUE, 'U012'),
('A013', 'Coco', 'Oiseau', 'Perruche', 1.0, FALSE, 'U013'),
('A014', 'Thumper', 'Lapin', 'Holland Lop', 3.0, TRUE, 'U016'),
('A015', 'Bubbles', 'Poisson', 'Betta', 2.0, FALSE, 'U016'),
('A016', 'Charlie', 'Chien', 'Bulldog', 5.5, TRUE, 'U016'),
('A017', 'Luna', 'Chat', 'British Shorthair', 3.5, TRUE, 'U017'),
('A018', 'Polly', 'Oiseau', 'Cockatiel', 2.5, FALSE, 'U019'),
('A019', 'Snowball', 'Lapin', 'Lionhead', 4.0, TRUE, 'U019'),
('A020', 'Dory', 'Poisson', 'Tang', 1.5, FALSE, 'U020'),
('A021', 'Rocky', 'Chien', 'Rottweiler', 7.0, TRUE, 'U021'),
('A022', 'Whiskers', 'Chat', 'Sphynx', 3.0, TRUE, 'U022'),
('A023', 'Tweety', 'Oiseau', 'Lovebird', 1.5, FALSE, 'U024'),
('A024', 'Peter', 'Lapin', 'Mini Rex', 2.5, TRUE, 'U024'),
('A025', 'Splash', 'Poisson', 'Guppy', 1.0, FALSE, 'U025'),
('A026', 'Zeus', 'Chien', 'Doberman', 6.5, TRUE, 'U025'),
('A027', 'Misty', 'Chat', 'Ragdoll', 4.5, TRUE, 'U027'),
('A028', 'Kiwi', 'Oiseau', 'Conure', 2.0, FALSE, 'U028'),
('A029', 'Hopper', 'Lapin', 'Dutch', 3.0, TRUE, 'U029'),
('A030', 'Finny', 'Poisson', 'Catfish', 1.5, FALSE, 'U029');

SELECT * FROM Animals;

INSERT INTO Pet_Sitters (PS_ID, PS_Description, PS_Experience, PS_Hourly_Rate, PS_Availability, US_ID) VALUES 
('PS001', 'Pet sitter expérimentée, aime les animaux et les promenades en plein air.', '5 ans d\'expérience avec divers animaux.', 15.50, '2024-08-01', 'U003'),
('PS003', 'Retraité, beaucoup de temps libre pour s\'occuper de vos animaux.', '3 ans d\'expérience en tant que pet sitter.', 10.00, '2024-08-10', 'U006'),
('PS004', 'Aime les animaux, disponible tous les jours de la semaine.', '4 ans d\'expérience avec des chiens et des chats.', 14.00, '2024-08-15', 'U008'),
('PS005', 'Amoureuse des animaux exotiques, spécialiste des NAC.', '6 ans d\'expérience avec des reptiles et des oiseaux.', 18.00, '2024-08-20', 'U014'),
('PS006', 'Étudiant, adore les chiens et disponible en soirée.', '1 an d\'expérience avec les chiens.', 11.50, '2024-08-25', 'U015'),
('PS007', 'Passionné des chats, disponible le matin.', '2 ans d\'expérience avec les chats.', 13.00, '2024-08-30', 'U018'),
('PS008', 'Retraitée, aime prendre soin des animaux de compagnie.', '4 ans d\'expérience avec divers animaux.', 9.50, '2024-09-01', 'U023'),
('PS009', 'Éducateur canin certifié, disponible le weekend.', '5 ans d\'expérience avec des chiens de toutes races.', 17.00, '2024-09-05', 'U026'),
('PS002', 'Expérience en soins de santé des animaux, disponible en soirée.', '4 ans d\'expérience en clinique vétérinaire.', 14.50, '2024-09-15', 'U030');

SELECT * FROM Pet_Sitters;

INSERT INTO Payments (PA_ID, PA_Date, PA_Total_Price, PA_Type, PA_Status) VALUES 
('P001', '2024-07-01', 150.00, 'Credit Card', 'Confirmed'),
('P002', '2024-07-05', 120.00, 'Paypal', 'Pending'),
('P003', '2024-07-10', 180.00, 'Payment by transfer', 'Executed'),
('P004', '2024-07-15', 200.00, 'Credit Card', 'Cancelled'),
('P005', '2024-07-20', 100.00, 'Paypal', 'Confirmed'),
('P006', '2024-07-25', 90.00, 'Credit Card', 'Confirmed'),
('P007', '2024-07-30', 110.00, 'Paypal', 'Pending'),
('P008', '2024-08-01', 130.00, 'Payment by transfer', 'Executed'),
('P009', '2024-08-05', 140.00, 'Credit Card', 'Cancelled'),
('P010', '2024-08-10', 160.00, 'Paypal', 'Confirmed'),
('P011', '2024-08-15', 170.00, 'Credit Card', 'Pending'),
('P012', '2024-08-20', 190.00, 'Paypal', 'Executed'),
('P013', '2024-08-25', 210.00, 'Payment by transfer', 'Cancelled'),
('P014', '2024-08-30', 220.00, 'Credit Card', 'Confirmed'),
('P015', '2024-09-01', 230.00, 'Paypal', 'Pending');

SELECT * FROM Payments;

INSERT INTO Reservations (RE_ID, RE_Start_Date, RE_End_Date, RE_Total_Price, RE_Status, PA_ID, PS_ID, US_ID) VALUES 
('R001', '2024-08-01', '2024-08-07', 150.00, 'confirmed', 'P001', 'PS001', 'U001'),
('R002', '2024-08-05', '2024-08-10', 120.00, 'pending', 'P002', 'PS002', 'U002'),
('R003', '2024-08-10', '2024-08-15', 180.00, 'completed', 'P003', 'PS003', 'U004'),
('R004', '2024-08-15', '2024-08-20', 200.00, 'cancelled', 'P004', 'PS004', 'U005'),
('R005', '2024-08-20', '2024-08-25', 100.00, 'confirmed', 'P005', 'PS005', 'U007'),
('R006', '2024-08-25', '2024-08-30', 90.00, 'confirmed', 'P006', 'PS006', 'U009'),
('R007', '2024-08-30', '2024-09-05', 110.00, 'pending', 'P007', 'PS007', 'U010'),
('R008', '2024-09-01', '2024-09-07', 130.00, 'completed', 'P008', 'PS008', 'U011'),
('R009', '2024-09-05', '2024-09-10', 140.00, 'cancelled', 'P009', 'PS009', 'U012'),
('R010', '2024-09-10', '2024-09-15', 160.00, 'confirmed', 'P010', 'PS001', 'U013'),
('R011', '2024-09-15', '2024-09-20', 170.00, 'pending', 'P011', 'PS004', 'U016'),
('R012', '2024-09-20', '2024-09-25', 190.00, 'completed', 'P012', 'PS002', 'U017'),
('R013', '2024-09-25', '2024-09-30', 210.00, 'cancelled', 'P013', 'PS009', 'U019'),
('R014', '2024-09-30', '2024-10-05', 220.00, 'confirmed', 'P014', 'PS003', 'U020'),
('R015', '2024-10-01', '2024-10-07', 230.00, 'pending', 'P015', 'PS001', 'U021');

SELECT * FROM Reservations;









