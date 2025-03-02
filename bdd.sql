CREATE TABLE Genre (
    ID_genre INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL
);

CREATE TABLE Categorie (
    ID_categorie INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL
);

CREATE TABLE Editeur (
    ID_edition INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL
);

CREATE TABLE Auteur (
    ID_Auteur INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL
);

CREATE TABLE Livre (
    ID_livre INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Resume TEXT,
    ID_edition INT,
    ID_categorie INT,
    FOREIGN KEY (ID_edition) REFERENCES Maison_d_edition(ID_edition),
    FOREIGN KEY (ID_categorie) REFERENCES Categorie(ID_categorie)
);

-- Association entre Auteur et Livre
CREATE TABLE Livre_auteur ( 
    ID_Auteur INT,
    ID_livre INT,
    PRIMARY KEY (ID_Auteur, ID_livre),
    FOREIGN KEY (ID_Auteur) REFERENCES Auteur(ID_Auteur),
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre)
);

-- Association entre Genre et Livre
CREATE TABLE Asso_10 ( 
    ID_genre INT,
    ID_livre INT,
    PRIMARY KEY (ID_genre, ID_livre),
    FOREIGN KEY (ID_genre) REFERENCES Genre(ID_genre),
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre)
);

CREATE TABLE Abonne (
    ID_abonne INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Adresse TEXT,
    Email VARCHAR(255),
    Telephone VARCHAR(20)
);

 -- Association entre Abonné et Livre
CREATE TABLE Asso_6 (
    ID_abonne INT,
    ID_livre INT,
    PRIMARY KEY (ID_abonne, ID_livre),
    FOREIGN KEY (ID_abonne) REFERENCES Abonne(ID_abonne),
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre)
);

CREATE TABLE Pret (
    ID_pret INT PRIMARY KEY,
    Date_ DATE NOT NULL,
    ID_abonne INT,
    FOREIGN KEY (ID_abonne) REFERENCES Abonne(ID_abonne)
);



--Partie 2
CREATE TABLE Genre (
    ID_genre INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Categorie (
    ID_categorie INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Editeur (
    ID_edition INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Auteur (
    ID_Auteur INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL
);

CREATE TABLE Livre (
    ID_livre INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(255) NOT NULL,
    Resume TEXT,
    ID_edition INT,
    ID_categorie INT,
    FOREIGN KEY (ID_edition) REFERENCES Editeur(ID_edition) ON DELETE SET NULL,
    FOREIGN KEY (ID_categorie) REFERENCES Categorie(ID_categorie) ON DELETE SET NULL
);

-- Association entre Auteur et Livre
CREATE TABLE Livre_Auteur ( 
    ID_Auteur INT,
    ID_livre INT,
    PRIMARY KEY (ID_Auteur, ID_livre),
    FOREIGN KEY (ID_Auteur) REFERENCES Auteur(ID_Auteur) ON DELETE CASCADE,
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre) ON DELETE CASCADE
);

-- Association entre Genre et Livre
CREATE TABLE Livre_Genre ( 
    ID_genre INT,
    ID_livre INT,
    PRIMARY KEY (ID_genre, ID_livre),
    FOREIGN KEY (ID_genre) REFERENCES Genre(ID_genre) ON DELETE CASCADE,
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre) ON DELETE CASCADE
);

CREATE TABLE Abonne (
    ID_abonne INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    Adresse TEXT,
    Email VARCHAR(255) UNIQUE,
    Telephone VARCHAR(20)
);

-- Table des emprunts pour mieux gérer les prêts
CREATE TABLE Emprunt (
    ID_emprunt INT PRIMARY KEY AUTO_INCREMENT,
    ID_abonne INT,
    ID_livre INT,
    Date_emprunt DATE NOT NULL,
    Date_retour_prevue DATE NOT NULL,
    Date_retour_effective DATE,
    Statut ENUM('En cours', 'Retourné') DEFAULT 'En cours',
    FOREIGN KEY (ID_abonne) REFERENCES Abonne(ID_abonne) ON DELETE CASCADE,
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre) ON DELETE CASCADE
);