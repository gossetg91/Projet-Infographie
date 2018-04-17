extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var idle = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func toggle():
	get_node("Timer").start()
	if !idle : 
		translate(Vector2(0,-800))
		idle = true

func _on_Timer_timeout():
	translate(Vector2(0,800))
	idle = false
	pass # replace with function body
