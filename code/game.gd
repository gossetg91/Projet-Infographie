extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var woodStickTaken = false
var stripTaken = false
var silexTaken = false
var tokenTaken = []
var keyTaken = false
var fin = false
var coatTaken = false
var ladderTaken = false
var ladderBlocs = []

func _ready():
	ladderBlocs.push_back(get_node("ladderBloc"))
	
	print(get_node("Herse").translation.y)
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
	if !silexTaken:
		cTSilex()

	if !tokenTaken[1]:
		checktoken2()
	if !tokenTaken[2]:
		checktoken3()
	
	if(!ladderTaken):
		cTLadder()
	
	if(!keyTaken):
		checkkey()
	elif get_node("Door").get("toggled") == true:
		openDoor()
		
	else:	
		if(!coatTaken):
			cTCoat()
		if !tokenTaken[0]:
			checktoken1()
		if !fin:
			cEndGame()
		if !stripTaken:
			cTStrip()
		cEnableTorch()
	pass
	
func cTWoodStick():
	if(get_node("player").get_translation().x < get_node("branch").get_translation().x+3 and get_node("player").get_translation().x > get_node("branch").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("branch").get_translation().z+3 and get_node("player").get_translation().z > get_node("branch").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("branch").translate(Vector3(0,-200,0))
				woodStickTaken = true
				
	pass
func cTCoat():
	if(get_node("player").get_translation().x < get_node("coat").get_translation().x+3 and get_node("player").get_translation().x > get_node("coat").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("coat").get_translation().z+3 and get_node("player").get_translation().z > get_node("coat").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("coat").translate(Vector3(0,-200,0))
				coatTaken = true
				
	pass
	
func cTStrip():
	if(get_node("player").get_translation().x < get_node("strip").get_translation().x+3 and get_node("player").get_translation().x > get_node("strip").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("strip").get_translation().z+3 and get_node("player").get_translation().z > get_node("strip").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("strip").translate(Vector3(0,-200,0))
				stripTaken = true

func cTSilex():
	if(get_node("player").get_translation().x < get_node("silex").get_translation().x+3 and get_node("player").get_translation().x > get_node("silex").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("silex").get_translation().z+3 and get_node("player").get_translation().z > get_node("silex").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("silex").translate(Vector3(0,-200,0))
				silexTaken = true
				
	pass
func cTLadder():
	if(get_node("player").get_translation().x < get_node("ladder").get_translation().x+1 and get_node("player").get_translation().x > get_node("ladder").get_translation().x-1):
		if (get_node("player").get_translation().z < get_node("ladder").get_translation().z+8 and get_node("player").get_translation().z > get_node("ladder").get_translation().z):
			if(Input.is_key_pressed(KEY_E)):
				get_node("ladder").translate(Vector3(0,-200,0))
				get_node("ladderPlay").set("toggled",true)
				ladderTaken = true
				
	pass

func cEnableTorch():
	if woodStickTaken and stripTaken and silexTaken:
		get_node("player/Torch").set("toggled",true)

func cEnableDoor():
	if keyTaken:
		get_node("House/Door").set("toggled",true)
	
func checktoken1():
	if(get_node("player").get_translation().x < get_node("token1").get_translation().x+3 and get_node("player").get_translation().x > get_node("token1").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("token1").get_translation().z+3 and get_node("player").get_translation().z > get_node("token1").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token1/Token").translate(Vector3(0,-200,0))
				get_node("token1/unanimated").translate(Vector3(0,200,0))
				tokenTaken[0] = true
func checktoken2():
	if(get_node("player").get_translation().x < get_node("token2").get_translation().x+3 and get_node("player").get_translation().x > get_node("token2").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("token2").get_translation().z+3 and get_node("player").get_translation().z > get_node("token2").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token2/Token").translate(Vector3(0,-200,0))
				get_node("token2/unanimated").translate(Vector3(0,200,0))
				tokenTaken[1] = true
func checktoken3():
	if(get_node("player").get_translation().x < get_node("token3").get_translation().x+3 and get_node("player").get_translation().x > get_node("token3").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("token3").get_translation().z+3 and get_node("player").get_translation().z > get_node("token3").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token3/Token").translate(Vector3(0,-200,0))
				get_node("token3/unanimated").translate(Vector3(0,200,0))
				tokenTaken[2] = true
				
func checkkey():
	if(get_node("player").get_translation().x < get_node("Key").get_translation().x+3 and get_node("player").get_translation().x > get_node("Key").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("Key").get_translation().z+3 and get_node("player").get_translation().z > get_node("Key").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("Key").translate(Vector3(0,-200,0))
				keyTaken = true

func openDoor():
	if(get_node("player").get_translation().x < get_node("Door").get_translation().x+21 and get_node("player").get_translation().x > get_node("Door").get_translation().x-21):
		if (get_node("player").get_translation().z < get_node("Door").get_translation().z+3 and get_node("player").get_translation().z > get_node("Door").get_translation().z-3):
			print("test")
			if(Input.is_key_pressed(KEY_E)):
				get_node("Door").toggle()
				
func cEndGame():
	if tokenTaken[0] and tokenTaken[1] and tokenTaken[2]:
		get_node("Herse").set("wait",false)
		print("fin")
		fin = true

func checkLadder():
	for i in range(0,ladderBlocs.size()):
		if(get_node("player").get_translation().x < ladderBlocs[i].get_translation().x+3 and get_node("player").get_translation().x > ladderBlocs[i].get_translation().x-3):
			if (get_node("player").get_translation().z < ladderBlocs[i].get_translation().z+3 and get_node("player").get_translation().z > ladderBlocs[i].get_translation().z-3):
				return ladderBlocs[i]
	return null
			
