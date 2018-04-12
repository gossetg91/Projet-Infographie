extends MenuButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Input.set_mouse_mode(0)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_buttonQuit_pressed():
	get_tree().quit()
