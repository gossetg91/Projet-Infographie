extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var wait = true
var pos = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _process(delta):
	print()
	if !wait and translation.y<21.46:
		move_and_slide((Vector3(0,10,0)))
	pass
