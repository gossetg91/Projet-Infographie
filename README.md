	Organisation des fichiers dans le repository
	---------------------------------------------------------------
	
	Les fichiers dans le repository sont organisés de la façon suivante:
	
	Tout les éléments sont répartis part types d'éléments:
	
	-assets contiens toutes les scènes et les sous-scènes 2D et 3D de godot
	-code et dans ses différents sous dossiers (en fonction du type d'éléments pilotés par le code) contiennent le code qui a été écrit pour le projet en GDScript.
	-textures contiens les différentes textures que l'on a utilisé dans notre projet, completed contiens les textures finales appliquées sur les UV map, drawed contiens des textures seamless directement dessinées par les membres du groupe, écran menu et ecran osd contienne les menu est les affichages qui se font a l'écran quand on est en jeu, original_canvas contiens les uv maps originales qui ont été exportées depuis blender (certaines ont été ecrasées par des textures semi-finies a la suite d'erreur de sauvegarde, pattern contiens des symboles utilisées sur les pidestaux de token. Enfin downloaded contiens des textures qui ont été téléchargées sur le site texture.com (réutilisation autorisée). Enfin black_and_white_for_normalmap contiens des textures en noir et blanc issue des textures téléchargées permettant de créer un relief sur le modèle high poli associé pour générer la normal map (en utilisant la fonction displace qui crée un relief en fonction du niveau de gris. 
	-originals contiens tout les modèles de base au format blender, ceux-cis sont répartit par niveau ou ils aparaissent (ceux qui aparaissent dans tout les niveau sont a la racine); ce dossier contiens aussi un dossier export qui contiens tout les modèles en version exportées DAE prêts a être employés . Pour éviter les conflicts avec les matériaux au moment de l'import, on a décidé de cloisonner les éléments dans des dossiers séparés en cas de besoin.
	-normalMaps contiens aussi bien les normal maps que l'on a effectués nous même et celle qui ont été téléchargées , la différenciation est faite dans le fichier de licence associé.
	
	Organisation des fichiers de licence.
	-------------------------------------------------------
	
	Dans le repository nous avons décidé d'utiliser principalement deux licences pour nos différents éléments que l'on a pa dans le repository:
	
	-pour les documents vraiment impersonnels nous avons décidé d'utiliser la GNU GPL v3.0
	-pour les documents qui font plus appels a une création "artistique" de notre part nous avons favorisé l'utilisation d'une licence MIT qui impose la citation des noms des créateurs au moment ou on les réutilises, tout en garantissant l'ouverture des sources.
	
	On a donc créer un fichier de licence par sous dossier pour adapter la licence au contenu qu'il y avait dedans , et dans le cas ou il y avait besoin de gérer des cas particuliers (fichiers qui ne sont pas régies par notre licence de part le fait qu'ils ont été réutilisés depuis un site donc ne nous appartenant pas par exemple) une explication des éléments concernés par la licence et l'exclusion ainsi que la raison de l'exclusion de certains éléments contenus dedans.
	
	Ouverture du projet et compilation a partir du projet
	-----------------------------------------------------
	
	Pour pouvoir ouvrir le projet dans godot, il faut l'ouvrir le fichier project.godot stocké dans le repository.
	
	Au moment de l'ouverture du projet on arrives pas tout de suite dans la scène principale étant donné qu'il affiche la première scène a ce lancer au moment de l'ouverture du projet qui est le menu principal. Il faut donc dans le visualiseur d'assets aller dans le dossier assets puis ouvrir CoreScene.tscn
	
	!Attention! : au moment de l'ouverture du projet le programme peut avoir besoin d'importer des textures et des modèles qui sont assez lourd (étant donné leurs tailles il y avait besoin d'avoir une texture haute résolution). Une configuration avec minimum 16GO de ram est recommandé, (il se peut que le programme bloque a l'import des plus gros fichier ou crash ce n'est pas grave cette opération d'import est unique et ne ce reproduira plus après. Il suffit de le relancer jusqu'a ce que la séquence d'import se termine. Au moment du fonctionnement l'utilisation de mémoire peut aussi être assez haute.
	
	Pour compiler le jeu il faut suivre la procédure classique sur godot pour l'exporter sur le système d'exploitation choisi.
	
	Lancement du jeu un exécutable du jeu est disponible directement dans le dossier "jeu" du repository, cependant il faudra aussi avoir les assets qui vont avec le jeu, le package qui les contiens étant trop grand pour git il faudra donc le télécharger au lien suivant [lien].
	
	Encore une fois en fonctionnement le jeu peut demander jusqu'a 3go de ram car il n'est pas très optimisé. L'utilisation d'un pc avec une carte graphique dédiée est souhaitable.
	
	Informations sur le fonctionnement du jeu.
	------------------------------------------
	
	-Il y a un seul bug majeur concernant le saut, étant donné que je n'ai pas réussi a différencier les hitbox mur et sol des objets sur lesquels on a le droit de sauter, il est possible de ce coller a un mur et de sauter a l'infini, alors que normalement c'est capé de part le fait que l'on ne touche plus le sol , en dehors de ce cas le saut est parfaitement fonctionnel.
	
	-Si la texture du lit bug un peu, cela viens du filtre flou qu'appliques godot sur les modèles.
	
	-Pour pouvoir monter aux échelles de manière efficace il faut regarder en haut et sprinter quand on arrive en haut pour sortir de la zone ou le personnage a tendance a sautiller.
	
	-Le fonctionnement des échelles est le suivant: il faut ce mettre devant et continuer d'avancer , le personnage commencera a monter tout seul.
	
	-parfois il peut y avoir des petits problèmes de jonction entre les hitbox (notamment au niveau du sol dans la partie avec la grotte (car il a fallu créer des hitbox pour le sol passant tout autour de la grotte sans la bloquer) si on se retrouve bloqué il suffit de faire un petit saut pour se déboquer (assez rare).
	
	-Encore une fois nous n'avons pas réussi a bien "hitboxer" la grotte, elle n'est donc pas sécurisée face au chutes et il est déconseillé de tomber dedans .
	
	-Par manque de temps les stub de la porte de la maison de la montagne ne sont pas encore hitboxé donc il est normal de clipper a travers.
	
	-Suite a un bug le mur du fond de cette même maison peut être traversé alors que j'y avait mis une hitbox qui est le deuxième bug a ne pas avoir pu être corrigé correctement par manque de temps.
	
	-il est recommandé de lancer le jeu avec une console, car au moment ou on place les tokens comme l'animation n'as pas pu être exporté vers godot le seul retour visuel pour le bon placement des token est dans la console (une ligne 1ok ,2ok, 3ok apparait).
	
	-Pour utiliser les pilones il ne faut pas ce placer trop près.
	
	-Enfin le saut et un peu abrupte et les premiers passage sur le pont risque de rater.
	
	!attention! : le jeu a été programmé avec les touches d'un clavier français, il faut donc penser a basculer le binding du clavier pour pouvoir utiliser "wasd". 
	
	rappel du bindage des touches :
	
	Z : avancer
	S : reculer
	Q : straffe a gauche
	D : straffe a droit
	
	souris : tourner la caméra
	
	e : interagire, ramasser , placer élément.
	t : activer/désactiver la torche quand celle ci a été ramassée.
	
	shift : sprinter
	space : sauter
	
	la soluce officielle du jeu 
	---------------------------
	
	-Il faut tout d'abord ramasser la clé qui se trouve par terre devant la maison pour l'ouvrir 
	-dans la maison ce trouve plusieurs objet a ramasser:
		-le manteau pour pouvoir escalader la montage,
		-la clé pour ouvrir la trappe dans la maison de la montagne
		-le rouleau de bandage pour la torche et le premier token
	
	-une fois le token ramassé la grille donnant accès aux autres niveaux
	-il faut cependant aller derrière le plus gros arbre pour ramasser la branche qui est placée qui sert a fabriquer la 		torche.
	
	-il faut ensuite ce dirriger vers la montagne et l'escalader (sans manteau on est coincés rapidement après la première 		série d'échelle.
	
	-sur la plateforme juste après le pont, il faut chercher un silex sur le sol qui est la dernière pièce pour obtenir la torche qui devient ensuite utilisable. 
	
	-Decendre ensuite la série d'échelle et actionner le levier permettant d'ouvrir la maison de la montagne
	
	-refaire le chemin inverse et rentrer dans la maison,
	-puis il faut utiliser la clé récupérée dans la maison avec la serrure qui est en bas.
	-il faut ensuite monter l'échelle permettant d'atteindre le deuxième token qu'il faut ramasser
	
	-ensuite aller dans le 3ème niveau (non fonctionnel et ramasser le dernier token placé a coté du feu.
	
	-placer les 3 tokens sur chacun des piédestaux du hub et franchire la grille
	
	--fin--
	
	
	(historique a titre indicatif) la répartition de la création des modèles principaux dans le groupe
	--------------------------------------------------------------------------------------------------
	- Grotte : NA
	- Montagne : Guillaume
	x Mur : Guigui
	- Manteau : Eric
	x Torche : Guigui
	x Silex : Eric
	x Sapin avec squelette : Eric 
	- Arbre pourri sans squellete : 3/personnes On les fait du coup ?
	x Clef : Eric
	Gx 7-  Caillou : 5-10 /pers
	x Echelle : Guillaume
	x Maison : Eric
	x Grande Porte : Eric
	x Skybox : Guigui fait le stp
	x Porte manteau + Table + lit + chaise : GuiGui
	x Token + piedestal : GuiGui
	x Bout de bois / torche : GuiGui
	x Bandage : Guillaume
	- Hub : Guillaume
