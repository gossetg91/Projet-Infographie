extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var exausted = false
var toggled = false

func _ready():
	translate(Vector3(0,-200,0))
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	print(get_translation().y)
	toggleCheck()
	pass

func toggleCheck():
	if(Input.is_key_pressed(KEY_T) and !exausted and toggled):
		if(get_translation().y<0):
			translate(Vector3(0,+200,0))
		else:
			translate(Vector3(0,-200,0))
		#cooldown du toggle
		exausted = true
		get_node("Cooldown").start()
	

func _on_Cooldown_timeout():
	exausted = false
	pass # replace with function body
