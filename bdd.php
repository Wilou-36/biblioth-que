<?php 


class BDD {
    private $password = 'biblio';
    private $username = 'biblio';
    private $servername = '192.168.1.60';
    private $dbname = 'Biblio';
    private $port= 3306;

	private $mysqli;
	

	public function __construct() {
		$this -> mysqli = false;
	}

	/* Connexion à la base de données */
	public function connexion() {
		mysqli_report(MYSQLI_REPORT_OFF);
		
		$this -> mysqli = new mysqli(servername, username, password, dbname);

		if($this -> mysqli -> connect_errno != 0) {
			return false;
		}
		else return true;
	}
	
	
	/* Déconnexion à la base de données */
	public function deconnexion() {
		if($this -> mysqli -> connect_errno != 0) {
			$this -> mysqli -> close();
		}
	}
	
	/* Récupération de la liste des livres */
	public function getLivre($livre_id) {
		//TODO
		
		
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