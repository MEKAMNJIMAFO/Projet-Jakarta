-- 1. Nettoyage (Ordre important à cause des clés étrangères)
DROP TABLE IF EXISTS LIVRE;
DROP TABLE IF EXISTS AUTEUR;
DROP TABLE IF EXISTS "user";

-- 2. Table AUTEUR (Utilisation de INT pour correspondre à ton Model Java)
CREATE TABLE AUTEUR (
    matricule INT PRIMARY KEY, 
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    genre VARCHAR(20) CHECK (genre IN ('Masculin', 'Féminin')) NOT NULL
);

-- 3. Table LIVRE (Ajout de image_path et correction des types)
CREATE TABLE LIVRE (
    ISBN BIGINT PRIMARY KEY, -- BIGINT pour accepter les longs numéros ISBN
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    date_edition DATE,
    editeur VARCHAR(50) CHECK (editeur IN ('ENI', 'DUNOD', 'FIRST')) NOT NULL,
    matricule INT,
    image_path VARCHAR(255), -- Colonne pour stocker le nom du fichier image
    FOREIGN KEY (matricule) REFERENCES AUTEUR(matricule) ON DELETE CASCADE
);

-- 4. Table user (Guillemets obligatoires car 'user' est un mot réservé)
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('ADMIN', 'VISITEUR')) NOT NULL
);

-- 5. Insertion de l'admin
INSERT INTO "user" (login, password, role) VALUES ('admin@admin', 'admin', 'ADMIN');