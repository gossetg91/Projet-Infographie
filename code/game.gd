extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var woodStickTaken = false
var stripTaken = false
var silexTaken = false
var tokenTaken = []

func _ready():
	#desactivation de la torche par défaut
	get_node("player/Torch").set("toggled",false)
	#initialisation des 3 tokens
	get_node("token1/unanimated").translate(Vector3(0,-200,0))
	get_node("token2/unanimated").translate(Vector3(0,-200,0))
	get_node("token3/unanimated").translate(Vector3(0,-200,0))
	
	tokenTaken.push_back(false)
	tokenTaken.push_back(false)
	tokenTaken.push_back(false)
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if !woodStickTaken:
		cTWoodStick()
	if !stripTaken:
		cTStrip()
	if !silexTaken:
		cTSilex()
	cEnableTorch()
	
	if !tokenTaken[0]:
		checktoken1()
	if !tokenTaken[1]:
		checktoken2()
	if !tokenTaken[2]:
		checktoken3()
	
	cEndGame()
	pass
	
func cTWoodStick():
	if(get_node("player").get_translation().x < get_node("branch").get_translation().x+1 and get_node("player").get_translation().x > get_node("branch").get_translation().x-1):
		if (get_node("player").get_translation().y < get_node("branch").get_translation().y+1 and get_node("player").get_translation().y > get_node("branch").get_translation().y-1):
			if(Input.is_key_pressed(KEY_E)):
				get_node("branch").translate(Vector3(0,-200,0))
				woodStickTaken = true
				
	pass
	
func cTStrip():
	if(get_node("player").get_translation().x < get_node("strip").get_translation().x+1 and get_node("player").get_translation().x > get_node("strip").get_translation().x-1):
		if (get_node("player").get_translation().y < get_node("strip").get_translation().y+1 and get_node("player").get_translation().y > get_node("strip").get_translation().y-1):
			if(Input.is_key_pressed(KEY_E)):
				get_node("strip").translate(Vector3(0,-200,0))
				stripTaken = true

func cTSilex():
	if(get_node("player").get_translation().x < get_node("silex").get_translation().x+1 and get_node("player").get_translation().x > get_node("silex").get_translation().x-1):
		if (get_node("player").get_translation().y < get_node("silex").get_translation().y+1 and get_node("player").get_translation().y > get_node("silex").get_translation().y-1):
			if(Input.is_key_pressed(KEY_E)):
				get_node("silex").translate(Vector3(0,-200,0))
				silexTaken = true
				
	pass

func cEnableTorch():
	if woodStickTaken and stripTaken and silexTaken:
		get_node("player/Torch").set("toggled",true)
	
func checktoken1():
	if(get_node("player").get_translation().x < get_node("token1").get_translation().x+1 and get_node("player").get_translation().x > get_node("token1").get_translation().x-1):
		if (get_node("player").get_translation().y < get_node("token1").get_translation().y+1 and get_node("player").get_translation().y > get_node("token1").get_translation().y-1):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token1/Token").translate(Vector3(0,-200,0))
				get_node("token1/unanimated").translate(Vector3(0,200,0))
				tokenTaken[0] = true
func checktoken2():
	if(get_node("player").get_translation().x < get_node("token2").get_translation().x+1 and get_node("player").get_translation().x > get_node("token2").get_translation().x-1):
		if (get_node("player").get_translation().y < get_node("token2").get_translation().y+1 and get_node("player").get_translation().y > get_node("token2").get_translation().y-1):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token2/Token").translate(Vector3(0,-200,0))
				get_node("token2/unanimated").translate(Vector3(0,200,0))
				tokenTaken[1] = true
func checktoken3():
	if(get_node("player").get_translation().x < get_node("token3").get_translation().x+1 and get_node("player").get_translation().x > get_node("token3").get_translation().x-1):
		if (get_node("player").get_translation().y < get_node("token3").get_translation().y+1 and get_node("player").get_translation().y > get_node("token3").get_translation().y-1):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token3/Token").translate(Vector3(0,-200,0))
				get_node("token3/unanimated").translate(Vector3(0,200,0))
				tokenTaken[2] = true
				
func cEndGame():
	if tokenTaken[0] and tokenTaken[1] and tokenTaken[2]:
		print("jeu fini GG")