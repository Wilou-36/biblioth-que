<?php 


class BDD {
    private $password = "biblio";
    private $username = "biblio";
    private $servername = '192.168.1.50';
    private $dbname = "biblio";
    private $port= 3306;

	private $mysqli;
	

	public function __construct() {
		$this -> mysqli = false;
	}

	/* Connexion à la base de données */
	public function connexion() {
		mysqli_report(MYSQLI_REPORT_OFF);
		
		$this -> mysqli = new mysqli($this->servername, $this->username, $this->password, $this->dbname);

		if($this -> mysqli -> connect_errno != 0) {
			return false;
		}
		else return true;
	}
	
	
	/* Déconnexion à la base de données */
	public function deconnexion() {
		if($this -> mysqli ) {
			$this -> mysqli -> close();
			$this -> mysqli = false;
		}
	}

	/* Récupération de la liste des livres */
	public function getLivre($ID_livre){
		if (!$this->mysqli) return false;

        $livres = [];  
        $requete = $this->mysqli->prepare("SELECT * FROM livres WHERE id=?");
        $requete->bind_param('i', $ID_livre);
        $requete->execute();
        $resultat = $requete->get_result();
        
        while ($enregistrement = $resultat->fetch_object()) {
            $livres[] = $enregistrement;
        }

        $requete->close();
        return $livres;
	}
	
	/* Récupération de la liste des genres */
	public function getgenre($ID_genre) {
		if (!$this->mysqli) return false;

        $genres = [];
        $requete = $this->mysqli->prepare("SELECT * FROM genres WHERE id=?");
        $requete->bind_param('i', $ID_genre);
        $requete->execute();
        $resultat = $requete->get_result();

        while ($enregistrement = $resultat->fetch_object()) {
            $genres[] = $enregistrement;
        }

        $requete->close();
        return $genres;
	}

	/* Récupération de la liste des categories */
	public function getcategorie($ID_categorie) {
		if (!$this->mysqli) return false;

        $categories = [];
        $requete = $this->mysqli->prepare("SELECT * FROM categories WHERE id=?");
        $requete->bind_param('i', $ID_categorie);
        $requete->execute();
        $resultat = $requete->get_result();

        while ($enregistrement = $resultat->fetch_object()) {
            $categories[] = $enregistrement;
        }

        $requete->close();
        return $categories;
	}

	/* Récupération de la liste des auteurs */
	public function getauteur($ID_auteur) {
		if (!$this->mysqli) return false;

        $auteurs = [];
        $requete = $this->mysqli->prepare("SELECT * FROM auteurs WHERE id=?");
        $requete->bind_param('i', $ID_auteur);
        $requete->execute();
        $resultat = $requete->get_result();

        while ($enregistrement = $resultat->fetch_object()) {
            $auteurs[] = $enregistrement;
        }

        $requete->close();
        return $auteurs;
	}
	
	
	/* Récupération des réponses d'une question en utilisant l'id de la question */
	public function getReponses($question_id) {
		$reponses = [];	//Servira a stocker la liste des reponses

		/* On crée la requete SQL et on lie les paramètres */
		$requete = $this -> mysqli-> prepare("SELECT reponse.id, reponse.intitule FROM reponse WHERE question_id=?");
		$requete -> bind_param('i', $question_id);
		
		/* On execute la requete et on récupère le résultat */
		$requete -> execute();
		$resultat = $requete -> get_result();
		
		/* On libère la requête */
		$requete -> close();
		
		
		/* On parcours les résultats pour les stocker */
		while ($enregistrement = $resultat -> fetch_object()) {
			$reponses[] = $enregistrement;	//On ajoute un element avec un l'id et l'intitule à la suite de nos réponses
		}
		
	
		return $reponses;		//On retourne les réponses de la question
	}
	
}







?>