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

var leverPressed = false

var tokenSetLst = []
var tokenCount = 0
var tokenSet = 0

var mKeyTaken = false

var keypadUsed = false

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
	
	
	tokenSetLst.push_back(false)
	tokenSetLst.push_back(false)
	tokenSetLst.push_back(false)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#game logic when in forest world
	for i in range(0, get_node("player").get_colliding_bodies().size()):
		if (get_node("player").get_colliding_bodies()[i].get_name() == "Environement"): 
			if !woodStickTaken:
				cTWoodStick()
	
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
				if !stripTaken:
					cTStrip()
				if !mKeyTaken:
					cMKey()
			
		elif( get_node("player").get_colliding_bodies()[i].get_name() == "finalHub"):
			if !tokenSetLst[0]:
				checkSet1();
			if !tokenSetLst[1]:
				checkSet2();
			if !tokenSetLst[2]:
				checkSet3();

		elif(get_node("player").get_colliding_bodies()[i].get_name() == "cave"):
			if !tokenTaken[2]:
				checktoken3()
				
		elif(get_node("player").get_colliding_bodies()[i].get_name() == "mountainLevel"):
				
			if !keypadUsed and mKeyTaken:
				checkKeypad()
			
			if !leverPressed:
				checkLever()
				
			if !silexTaken:
				cTSilex()
				
		elif(get_node("player").get_colliding_bodies()[i].get_name() == "bunker"):
			if !tokenTaken[1]:
				checktoken2()
	cContactManteau()
	cEnableTorch()

	if tokenSet == 3:
		if(get_node("HerseEnd").get("wait") == true):
			get_node("HerseEnd").set("wait",false)
		checkEnd();
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
				get_node("blocManteau").set("toggled",false);
				
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
				get_node("Herse").set("wait",false)
				tokenCount += 1;
				
func checktoken2():
	if(get_node("player").get_translation().x < get_node("token2").get_translation().x+3 and get_node("player").get_translation().x > get_node("token2").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("token2").get_translation().z+3 and get_node("player").get_translation().z > get_node("token2").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token2/Token").translate(Vector3(0,-200,0))
				get_node("token2/unanimated").translate(Vector3(0,200,0))
				tokenTaken[1] = true
				tokenCount += 1;
func checktoken3():
	if(get_node("player").get_translation().x < get_node("token3").get_translation().x+3 and get_node("player").get_translation().x > get_node("token3").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("token3").get_translation().z+3 and get_node("player").get_translation().z > get_node("token3").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("token3/Token").translate(Vector3(0,-200,0))
				get_node("token3/unanimated").translate(Vector3(0,200,0))
				tokenTaken[2] = true
				tokenCount += 1;
				
func checkkey():
	if(get_node("player").get_translation().x < get_node("Key").get_translation().x+3 and get_node("player").get_translation().x > get_node("Key").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("Key").get_translation().z+3 and get_node("player").get_translation().z > get_node("Key").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("Key").translate(Vector3(0,-200,0))
				keyTaken = true
func cMKey():
	if(get_node("player").get_translation().x < get_node("mountainKey").get_translation().x+3 and get_node("player").get_translation().x > get_node("mountainKey").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("mountainKey").get_translation().z+3 and get_node("player").get_translation().z > get_node("mountainKey").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("mountainKey").translate(Vector3(0,0,-800))
				mKeyTaken = true

func openDoor():
	if(get_node("player").get_translation().x < get_node("Door").get_translation().x+21 and get_node("player").get_translation().x > get_node("Door").get_translation().x-21):
		if (get_node("player").get_translation().z < get_node("Door").get_translation().z+3 and get_node("player").get_translation().z > get_node("Door").get_translation().z-3):
			if(Input.is_key_pressed(KEY_E)):
				get_node("Door").toggle()
				
func checkLever():
	if(get_node("player").get_translation().x < get_node("lever").get_translation().x+10 and get_node("player").get_translation().x > get_node("lever").get_translation().x-10):
		if (get_node("player").get_translation().z < get_node("lever").get_translation().z+10 and get_node("player").get_translation().z > get_node("lever").get_translation().z-10):
			if(Input.is_key_pressed(KEY_E)):
				get_node("lever").toggle()
				get_node("Door").toggle()
				get_node("stubDoor2").translate(Vector3(0,-800,0))
				
func cOpenDoor1():
	if tokenTaken[0]:
		get_node("Herse").set("wait",false)
		fin = true

func checkLadder():
	for i in range(0,ladderBlocs.size()):
		if(get_node("player").get_translation().x < ladderBlocs[i].get_translation().x+3 and get_node("player").get_translation().x > ladderBlocs[i].get_translation().x-3):
			if (get_node("player").get_translation().z < ladderBlocs[i].get_translation().z+3 and get_node("player").get_translation().z > ladderBlocs[i].get_translation().z-3):
				return ladderBlocs[i]
	return null
			
			
func tokenCount():
	var count = 0;
	
	for i in range(0,tokenTaken.size()):
		if(tokenTaken[i]):
			count += 1;
	
	return count - tokenSet;
	
func checkEnd():
	for i in range(0, get_node("player").get_colliding_bodies().size()):
		if (get_node("player").get_colliding_bodies()[i].get_name() == "endZone"):
			get_tree().change_scene("res://assets/menu/MenuFin.tscn")
			

func checkSet1():
	if(get_node("player").get_translation().x < get_node("setDetector1").get_translation().x+3 and get_node("player").get_translation().x > get_node("setDetector1").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("setDetector1").get_translation().z+3 and get_node("player").get_translation().z > get_node("setDetector1").get_translation().z-3):
			if tokenCount > 0 && tokenSetLst[0] == false && Input.is_key_pressed(KEY_E):
				tokenSetLst[0] = true
				tokenCount = tokenCount - 1 
				print("1ok")
				tokenSet += 1
func checkSet2():
	if(get_node("player").get_translation().x < get_node("setDetector2").get_translation().x+3 and get_node("player").get_translation().x > get_node("setDetector2").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("setDetector2").get_translation().z+3 and get_node("player").get_translation().z > get_node("setDetector2").get_translation().z-3):
			if tokenCount > 0 && tokenSetLst[1] == false && Input.is_key_pressed(KEY_E):
				tokenSetLst[1] = true
				tokenCount = tokenCount - 1 
				print("2ok")
				tokenSet += 1
func checkSet3():
	if(get_node("player").get_translation().x < get_node("setDetector3").get_translation().x+3 and get_node("player").get_translation().x > get_node("setDetector3").get_translation().x-3):
		if (get_node("player").get_translation().z < get_node("setDetector3").get_translation().z+3 and get_node("player").get_translation().z > get_node("setDetector3").get_translation().z-3):
			if tokenCount > 0 && tokenSetLst[2] == false && Input.is_key_pressed(KEY_E):
				tokenSetLst[2] = true
				tokenCount = tokenCount - 1 
				print("3ok")
				tokenSet += 1

func checkKeypad():
	print(get_node("player").get_translation().x)
	print(get_node("keypad").get_translation().x+5)
	print(get_node("keypad").get_translation().x-5)
	if(get_node("player").get_translation().x < get_node("keypad").get_translation().x+5 and get_node("player").get_translation().x > get_node("keypad").get_translation().x-5):
		if (get_node("player").get_translation().z < get_node("keypad").get_translation().z+5 and get_node("player").get_translation().z > get_node("keypad").get_translation().z-5):
			if(Input.is_key_pressed(KEY_E)):
				get_node("keypad").toggle()
				keypadUsed = true
				get_node("stubDoor").translate(Vector3(0,-800,0))

func cContactManteau():
	for i in range(0, get_node("player").get_colliding_bodies().size()):
		if(get_node("player").get_colliding_bodies()[i].get_name() == "blocManteau"):
			get_node("Cold").toggle()