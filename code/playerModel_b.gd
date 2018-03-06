extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currentPosition
var rotation_ori
var genralSpeedOffset = 500

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	set_process_input(true)
	set_process(true)
	pass

func _process(delta):

	set_linear_velocity(get_mvt()*500)
	pass

func _input(event):
	#mouse rotation managment for rotating the camera

	if(event is InputEventMouseMotion):
		#rotation relative
		
		#var rotationState = get_rotation_deg()
		var yaw = rad2deg(get_rotation().y)
		var pitch = rad2deg(get_node("model/Camera").get_rotation().x)
	
		yaw = fmod(yaw - event.relative.x * 0.5 , 360)
		pitch = max(min(pitch - event.relative.y * 0.5,80),-90)
		
		set_rotation(Vector3(0,deg2rad(yaw),0))
		get_node("model/Camera").set_rotation(Vector3(deg2rad(pitch),0,0))
		
func get_mvt():
	var translation = Vector3(0,0,0)
	var yaw = rad2deg(get_rotation().y)
	
	if yaw < 0:
		yaw+=360
	
	print(yaw)
		
	
	#reading inputs
	if(Input.is_key_pressed(KEY_Z)):
		translation += Vector3(0,0,-1)
	if(Input.is_key_pressed(KEY_Q)):
		translation += Vector3(-1,0,0)
	if(Input.is_key_pressed(KEY_S)):
		translation += Vector3(0,0,1)
	if(Input.is_key_pressed(KEY_D)):
		translation += Vector3(1,0,0)
	
	return translation
	