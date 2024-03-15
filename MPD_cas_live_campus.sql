-- Création de la table Role
CREATE TABLE Role (
    id_role SERIAL PRIMARY KEY,
    libelle_role VARCHAR(60)
);

-- Création de la table Responsable
CREATE TABLE Responsable (
    responsable_id SERIAL PRIMARY KEY,
    responsable_nom VARCHAR(60),
    responsable_prenom VARCHAR(60)
);

-- Création de la table Classe de Formation
CREATE TABLE Classe_de_Formation (
    code_classe_formation SERIAL PRIMARY KEY,
    libelle_court_classe_formation VARCHAR(10),
    Libelle_long_classe_formation VARCHAR(255),
    titre_professionnel_lie_classe_formation VARCHAR(100),
    date_debut_classe_formation DATE,
    Date_de_Fin_classe_formation DATE,
    id_assistant INT REFERENCES Assistant(e)_Pedagogique(Assistant(e)_Pedagogique_id)
);

-- Création de la table Titre professionnel
CREATE TABLE Titre_professionnel (
    id_titre_professionnel SERIAL PRIMARY KEY,
    niveau_titre_professionnel INT,
    Libelle_titre_professionnel VARCHAR(60),
    date_validite_titre_professionnel DATE
);

-- Création de la table Entreprise
CREATE TABLE Entreprise (
    id_siret_entreprise BIGINT PRIMARY KEY,
    raison_social_entreprise VARCHAR(60),
    adresse_entreprise VARCHAR(60),
    code_postal_entreprise INT,
    ville_entreprise VARCHAR(60),
    nom_dirigeant_entreprise VARCHAR(60),
    prenom_dirigeant_entreprise VARCHAR(60)
);

-- Création de la table Tuteur
CREATE TABLE Tuteur (
    id_tuteur SERIAL PRIMARY KEY,
    nom_tuteur VARCHAR(60),
    prenom_tuteur VARCHAR(60),
    telephone_tuteur BIGINT,
    adresse_mail_tuteur VARCHAR(60),
    id_Siret BIGINT REFERENCES Entreprise(id_siret_entreprise)
);

-- Création de la table Etudiant
CREATE TABLE Etudiant (
    carte_identite_etudiant SERIAL PRIMARY KEY,
    nom VARCHAR(60),
    prenom VARCHAR(60),
    email VARCHAR(60),
    annee_d_experience INT,
    adresse VARCHAR(100),
    code_postal INT,
    ville VARCHAR(60),
    telephone BIGINT,
    niveau_etude INT,
    id_Siret BIGINT REFERENCES Entreprise(id_siret_entreprise)
);

-- Création de la table Intervenant
CREATE TABLE Intervenant (
    id_siret_intervenant BIGINT PRIMARY KEY,
    nom_intervenant VARCHAR(60),
    prenom_intervenant VARCHAR(60),
    specialite_intervenant VARCHAR(60),
    statut_intervenant VARCHAR(60),
    adresse_intervenant VARCHAR(60),
    code_postal_intervenant VARCHAR(60),
    ville_intervenant VARCHAR(60)
);

-- Création de la table Salle Virtuelle
CREATE TABLE Salle_Virtuelle (
    id_salle_virtuelle SERIAL PRIMARY KEY,
    lien_connexion_salle_virtuelle VARCHAR(100)
);

-- Création de la table Cours
CREATE TABLE Cours (
    id_cours SERIAL PRIMARY KEY,
    numero_semaine_cours INT,
    numero_salle_virtuelle_cours INT,
    discipline_cours VARCHAR(60),
    id_intervenant BIGINT REFERENCES Intervenant(id_siret_intervenant)
);

-- Création de la table Facture
CREATE TABLE Facture (
    id_facture SERIAL PRIMARY KEY,
    date_reception_facture DATE,
    date_previsionnelle_paiement_facture DATE,
    nombre_heures_facture DECIMAL,
    taux_horaire_facture DECIMAL,
    tva_facture INT,
    date_intervention_facture DATE,
    sujet_intervention_facture VARCHAR(60),
    id_intervenant BIGINT REFERENCES Intervenant(id_siret_intervenant)
);

-- Création de la table Avis Etudiant
CREATE TABLE Avis_Etudiant (
    id_avis SERIAL PRIMARY KEY,
    note_avis INT,
    commentaire_avis VARCHAR(150),
    id_etudiant SERIAL REFERENCES Etudiant(carte_identite_etudiant)
);
