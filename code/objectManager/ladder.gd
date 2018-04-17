extends Spatial

var toggled = false
var displayed = false
var ok = true

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

func toggle(pos, angle):
	if(toggled and ok):
		if(displayed):
			set_rotation(Vector3(0,0,0))
			translate(Vector3(-200,-200,-200))
			print(get_translation())
			displayed= false
		else:
			set_rotation(Vector3(0,0,0))
			var translation = Vector3(pos-get_translation())
			print(translation)
			translate(translation)
			set_rotation(angle)
			print(pos)
			print(get_translation())
			displayed = true
		ok = false
		get_node("Cooldown").start()

func _on_Cooldown_timeout():
	ok =true
	pass # replace with function body
