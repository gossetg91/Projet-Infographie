extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var toggled = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func toggle():
	if(toggled):
		get_node("AnimationPlayer2").play("default")
		print("test")
		toggled = false;