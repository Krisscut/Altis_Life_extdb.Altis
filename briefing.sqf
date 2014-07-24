waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Règles genéral"];
player createDiarySubject ["involvedgaming","Involved-Gaming"];
player createDiarySubject ["safezones","Safe Zones)"];
player createDiarySubject ["illegalitems","Activitées illégales"];
player createDiarySubject ["controls","Controles"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change log",
				"
                <br/>
					The official change log can be found on the BIS forums : http://forums.bistudio.com/showthread.php?168139-Altis-Life-RPG <br/><br/>
				"
		]
	];

// Règles serveur

    player createDiaryRecord ["serverrules",
        [
            "Rebelles",
                "
                <br/>
                Un rebelle est avant tout un civil !<br/>

                Par définition, un rebelle est une personne en désaccord avec le gouvernement en place et ses lois, c’est un personnage qui a pris les armes afin de pouvoir lutter de manière efficace contre l’oppression dont il se dit victime.<br/>
                Les rebelles ne sont pas sensés passer leur temps à farm l’argent, ils sont sensé faire plusieurs actions afin de lutter contre le gouvernement en place.<br/>
                Les rebelles sont libres d’ouvrir le feu sur les gendarmes à condition que cela aide leur cause : tirer sur un gendarme qui fait juste un contrôle de vitesse à un civil n’est pas toléré, en revanche tuer un gendarme car il s’apprêtait à vous contrôler vous ou l’un de vos amis et que vous transportiez des matières illicites est toléré.<br/>
                Par soucis de fairplay, vous DEVEZ essayez tout de même de discuter un minimum avant de tirer.<br/>
                <br/>
                Les règles:<br/>
                1. La rébellion n’excuse pas le RDM ou FK ( kill random ou free kill ) et sera suivi d’un ban.<br/>
                2. La rébellion doit être RP, et doit différer de l'attaque répétitive de banque.<br/>
                3. Le rébellion n’inclut pas de faire la guerre à la gendarmerie sans revendications préalables, les guerres de gangs sont possibles, etc.<br/>
                4. Interdit de voler ou dégrader les véhicules/hélicos tant que la personne coopère.<br/>
                5. Interdit de camper plus de 10 minutes sur une zone légale/illégale.<br/>
                6. Si un groupe rebelle attaque la banque, aucun autre groupe rebelle ne peut être présent sur les lieux.<br/>
                7. Si vous vous sentez menacé, vous pouvez vous défendre mais seulement après avec effectué une sommation. ( Si menace imminente avérée, telle une personne s’apprêtant ou ayant commencé à tirer sur vous, pas de sommations )<br/>
                8. Votre vie est ce qui vous est le plus chère ! Il vaut mieux vivre que mourir même si l'on doit passer par la case "prison" Jouez le jeu ! Soyez Fairplay.<br/>
                11. Tout ouverture de feu sur gendarmes, civils ou autres rebelles sur l'île d'Altis se doit d'être accompagnée d'une raison RP valable, le meurtre par plaisir ou caprice n'est pas autorisé.<br/>
                12. Tout groupe rebelle prévoyant une quelconque action (ex. Prise d'otage, Banque, etc.) doit s'assurer du nombre de gendarmes suffisant (voir règles générales).<br/>
                "
        ]
    ];


	player createDiaryRecord ["serverrules",
		[
			"Racket",
				"
                <br/>
				Les rebelles sont libre de racketter les civils/rebelles en tout lieu n’étant pas défini comme étant des « zones safe »<br/>
                Vous ne pouvez pas racket la même personne en moins d’une heure et ne pouvez pas camper une zone légal plus de 10 minutes, sauf action en cours auquel cas le temps peut être dépassé le temps de l’action.<br/><br/>
				"
		]
	];

    player createDiaryRecord ["serverrules",
		[
			"Règle de nouvelle vie",
				"
                <br/>
				La règle de la nouvelle vie s'applique dans certains cas précis.<br/>
                <br/>
                Si vous êtes tué par un autre joueur de façon RP (pas de freekill), c'est une nouvelle vie.<br/>
                Si vous faites une déconnexion/reconnexion, ce n'est pas une nouvelle vie.<br/>
                Si vous êtes pris sur le fait de se suicider pour éviter votre sentence ou pour échapper à une situation délicate, ce n'est pas une nouvelle vie et vous recevrez un blâme sur le serveur.<br/>
                Lorsque vous mourrez, vous entamez une nouvelle vie, vous ne pouvez pas vous rappeler des actions passées, ni de vos meurtriers et de vos lieux de mort. Un FreeKill n’engendre pas de nouvelle vie.<br/>
                Vous ne pouvez pas revenir sur zone après votre mort tant que l'action n'est pas terminée, cette règle est applicable quelque soit votre camp (civil, gendarme ou rebelle)<br/><br/>
				"
		]
	];

    player createDiaryRecord ["serverrules",
		[
			"Free Kill",
				"
                <br/>
				Le FreeKill est un meurtre commis sans aucune raison, c’est-à-dire qu'il est interdit de tuer qui que ce soit sans revendication(s)<br/>
                ni sommation(s) (en dehors des guerres de gangs validées par le STAFF). Tout Kill sortant du contexte RP est également considéré comme FreeKill.<br/>
                Le Road Kill(ce qui revient à écraser une personne avec un véhicule quel qu’il soit) est strictement interdit.<br/><br/>
				"
		]
	];

        player createDiaryRecord ["serverrules",
		[
			"Glitch, abus, bug et cheat",
				"
                <br/>
                 Tout glitch, abus et cheat sont passible de bannissement définitif. Sont considéré comme glitch/abus :<br/>
                 <br/>
                 - Sortir de la prison autrement qu'en hélicoptère<br/>
                 - Utilisation de tout bug du jeu pour vous avantager<br/>
                 - Duplication d'argent/d'item<br/>
                 - Cheat <br/>
                 - Se deconecter pour échapper à une action<br/>

                 Si une duplication arrivait par erreur, reportez là immédiatement à un administrateur (y --> mobile -> sms admin).<br/>
                 Si vous n'obtenez aucune réponse, jetez l'objet dupliqué dans un endroit isoler<br/>
                 Si un probleme intervient lors d'une action ou d'un événement en jeu, qui transgresserait les règles ou autres, vous devez vous référer UNIQUEMENT sur le forum ou sur Teamspeak, et non pas exposer une situation HRP en pleine action !<br/><br/>
				"
		]
	];

    player createDiaryRecord ["serverrules",
        [
            "Préambule",
                "
                <br/>
                 Il s'agit d'une liste des règles principale de notre serveur.<br/>
                 Il existe cependant d'autre règles, mieux détaillées présente sur notre forum à l'adresse suivante : http://forum.involved-gaming.com/index.php <br/>
                 Nous vous recomendons vivement de les lires, nous considérons que toute persone jouant sur notre serveur à lu, compris et acceptés ces règles. <br/>
                 En conséquence, ne venez pas vous plaindre si vous êtes sanctionné. Vous êtes prévenu ! <br/><br/>
                "
        ]
    ];

// Involved Gaming Section

	player createDiaryRecord ["involvedgaming",
		[
			"Teamspeak",
				"
                <br/>
				Vous pouvez nous retrouver sur notre teamspeak :<br/><br/>
				37.187.145.47<br/><br/>
				"
		]
	];

	player createDiaryRecord ["involvedgaming",
		[
			"Forum",
				"
                <br/>
				Voici l'adresse de notre forum :<br/>
                http://forum.involved-gaming.com/index.php <br/><br/>
                C'est également ici que toutes plainte/demande doit être formulé<br/><br/>
				"
		]
	];

// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Véhicules illégaux",
				"
                <br/>
				Toute personnes controlé par la gendarmerie avec ces véhicule s'expose à de fortes amendes :<br/><br/>

				1. Ifrit<br/>
                2. Strider<br/>
                3. Tout-terrain rebelle<br/>
                4. Tout-terrain armé<br/>
                5. Tempest transport<br/>
                6. Orca rebelle<br/>
                7. HumingBird rebelle<br/>
                8. Véhicule de gendarmerie<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Armes illégalles",
				"
                <br/>
				Un civil controlé en posséssion de ces armes s'expose à de forte amendes<br/><br/>

				1. Armes gendarmes (séries MX)<br/>
                2. Toute arme achetable aux camps rebelles<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Objets illégaux",
				"
                <br/>
				La posséssion des items suivant est illégalle<br/><br/>
				1. Tortue<br/>
				2. Heroine<br/>
                3. Cocaïne
                4. Méth
                5. Vetement et tenue rebelle (achetable aux camps rebelles uniquement)<br/>
				"
		]
	];


// Controls Section

	player createDiaryRecord ["controls",
		[
			"Controles",
				"
                <br/>
				Y: Player Menu<br/>
				U: Verrouiller et deverrouiller le véhicule<br/>
				F: Sirène de police/ambulancier<br/>
				T: Coffre du véhicule<br/>
                H: Menu interraction (ramasser objet, sortir prisonner du véhicule etc). Peut être configurer dans ESC -> Configurer -> Commandes -> Commandes personalisée -> Util.Action 10<br/>
				Left Shift + R: Menotter <br/>
				Left Shift + G: Assomer<br/>
				Left Shift + L: Activer les gyrophares (Gendarmes et ambulanciers).<br/>
				"
		]
	];