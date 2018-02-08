extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currentPosition

func _ready():
	set_process_input(true)
	set_process(true)
	pass

func _process(delta):
	translate(get_mvt())
	pass

func get_mvt():
	var translation = Vector3()
	var rotationState = get_rotation_deg()
	
	#reading inputs
	if(Input.is_action_pressed("ui_up")):
		translation.z = translation.z-5
	if(Input.is_action_pressed("ui_left")):
		translation.x = translation.x-5
	if(Input.is_action_pressed("ui_down")):
		translation.z = translation.z+5
	if(Input.is_action_pressed("ui_right")):
		translation.x = translation.x+5

	return translation
	