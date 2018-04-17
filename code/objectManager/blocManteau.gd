extends StaticBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var toggled = true 


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if !toggled :
		get_node("blocage manteau").translate(Vector3(0,-800,0))
	pass
