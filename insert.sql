-- insert table Genre
INSERT INTO Genre (Nom) VALUES ('Science-fiction', 'Fantasy', 'Romance', 'Horreur');

--insert table Categorie
INSERT INTO Categorie (Nom) VALUES ('Roman', 'BD', 'Poésie' 'Essai');


--insert table Editeur
INSERT INTO Maison_d_edition (Nom) VALUES ('Gallimard', 'Penguin Random House', 'Hachette', 'Albin Michel');

--insert table Auteur
INSERT INTO Auteur (Nom, Prenom) VALUES ('Asimov', 'Isaac');
INSERT INTO Auteur (Nom, Prenom) VALUES ('Tolkien', 'J.R.R.');
INSERT INTO Auteur (Nom, Prenom) VALUES ('Austen', 'Jane');
INSERT INTO Auteur (Nom, Prenom) VALUES ('King', 'Stephen');

--insert table Livre
INSERT INTO Livre (Nom, Resume, ID_edition, ID_categorie) 
VALUES ('Foundation', 'A saga of the collapse and rebirth of a galactic empire.', 1, 1);

INSERT INTO Livre (Nom, Resume, ID_edition, ID_categorie) 
VALUES ('The Hobbit', 'The adventure of Bilbo Baggins and the quest to reclaim a treasure.', 2, 1);

INSERT INTO Livre (Nom, Resume, ID_edition, ID_categorie) 
VALUES ('Pride and Prejudice', 'A classic novel about love, marriage, and class in 19th-century England.', 3, 1);

INSERT INTO Livre (Nom, Resume, ID_edition, ID_categorie) 
VALUES ('The Shining', 'A haunted hotel, a troubled family, and a terrifying force.', 4, 1);


--insert table livre_auteur
INSERT INTO Livre_Auteur (ID_Auteur, ID_livre) VALUES (1, 1);  -- Isaac Asimov - Foundation
INSERT INTO Livre_Auteur (ID_Auteur, ID_livre) VALUES (2, 2);  -- J.R.R. Tolkien - The Hobbit
INSERT INTO Livre_Auteur (ID_Auteur, ID_livre) VALUES (3, 3);  -- Jane Austen - Pride and Prejudice
INSERT INTO Livre_Auteur (ID_Auteur, ID_livre) VALUES (4, 4);  -- Stephen King - The Shining

--insert table Livre-Genre
INSERT INTO Livre_Genre (ID_genre, ID_livre) VALUES (1, 1);  -- Science-fiction - Foundation
INSERT INTO Livre_Genre (ID_genre, ID_livre) VALUES (1, 2);  -- Fantasy - The Hobbit
INSERT INTO Livre_Genre (ID_genre, ID_livre) VALUES (3, 3);  -- Romance - Pride and Prejudice
INSERT INTO Livre_Genre (ID_genre, ID_livre) VALUES (4, 4);  -- Horreur - The Shining


--insert table adonne
INSERT INTO Abonne (Nom, Prenom, Adresse, Email, Telephone) 
VALUES ('Dupont', 'Pierre', '123 Rue de Paris', 'pierre.dupont@example.com', '0123456789');

INSERT INTO Abonne (Nom, Prenom, Adresse, Email, Telephone) 
VALUES ('Lemoine', 'Marie', '456 Avenue des Champs', 'marie.lemoine@example.com', '0987654321');

INSERT INTO Abonne (Nom, Prenom, Adresse, Email, Telephone) 
VALUES ('Roux', 'Luc', '789 Boulevard Saint-Germain', 'luc.roux@example.com', '0147258369');


--insert table emprunt
INSERT INTO Emprunt (ID_abonne, ID_livre, Date_emprunt, Date_retour_prevue, Statut) 
VALUES (1, 1, '2025-03-01', '2025-03-15', 'En cours');

INSERT INTO Emprunt (ID_abonne, ID_livre, Date_emprunt, Date_retour_prevue, Statut) 
VALUES (2, 2, '2025-03-02', '2025-03-16', 'En cours');

INSERT INTO Emprunt (ID_abonne, ID_livre, Date_emprunt, Date_retour_prevue, Statut) 
VALUES (3, 3, '2025-02-25', '2025-03-11', 'Retourné');
