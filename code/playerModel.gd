extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currentPosition
var rotation_ori
var genralSpeedOffset = 50
var ladder = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	set_process_input(true)
	set_process(true)
	pass

func _process(delta):
	ladder = (get_node("../ladderPlay").get("displayed") == true && checkLadder())
	if ladder:
		set_linear_velocity(get_mvt(true)*25)
	else:
		if(Input.is_key_pressed(KEY_SHIFT)):
				set_linear_velocity(get_mvt(false)*50)
		else:
			set_linear_velocity(get_mvt(false)*25)
	jump()
	toggleLadder()
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
		
func get_mvt(ladder):
	var translation = Vector3(0,0,0)
	var yaw = rad2deg(get_rotation().y)
	
	if(yaw < 0):
		yaw +=360 
	
	
	#reading and increasing vector with angle correction
	if(Input.is_key_pressed(KEY_Z)):
		if(!ladder):
			if yaw >=0 and yaw <= 90:
				translation += Vector3(-yaw/90,0,-(90-yaw)/90)
			if yaw > 90 and yaw <= 180:
				translation += Vector3(-(90-(yaw-90))/90,0,((yaw-90))/90)
			if yaw > 180 and yaw <= 270:
				translation += Vector3((yaw-180)/90,0,(90-(yaw-180))/90)
			if yaw > 270 and yaw < 360:
				translation += Vector3((90-(yaw-270))/90,0,-(yaw-270)/90)
		else:
			translation+=Vector3(0,2,0)
	if(Input.is_key_pressed(KEY_Q)):
		if yaw >=0 and yaw <= 90:
			translation += Vector3(-(90-yaw)/90,0,yaw/90)
		if yaw > 90 and yaw <= 180:
			translation += Vector3(((yaw-90))/90,0,(90-(yaw-90))/90)
		if yaw > 180 and yaw <= 270:
			translation += Vector3((90-(yaw-180))/90,0,-(yaw-180)/90)
		if yaw > 270 and yaw < 360:
			translation += Vector3(-(yaw-270)/90,0,-(90-(yaw-270))/90)
	if(Input.is_key_pressed(KEY_S)):
		if yaw >=0 and yaw <= 90:
			translation += Vector3(yaw/90,0,(90-yaw)/90)
		if yaw > 90 and yaw <= 180:
			translation += Vector3((90-(yaw-90))/90,0,(-(yaw-90))/90)
		if yaw > 180 and yaw <= 270:
			translation += Vector3(-(yaw-180)/90,0,-(90-(yaw-180))/90)
		if yaw > 270 and yaw < 360:
			translation += Vector3(-(90-(yaw-270))/90,0,(yaw-270)/90)
	if(Input.is_key_pressed(KEY_D)):	
		if yaw >=0 and yaw <= 90:
			translation += Vector3((90-yaw)/90,0,-yaw/90)
		if yaw > 90 and yaw <= 180:
			translation += Vector3((-(yaw-90))/90,0,-(90-(yaw-90))/90)
		if yaw > 180 and yaw <= 270:
			translation += Vector3(-(90-(yaw-180))/90,0,(yaw-180)/90)
		if yaw > 270 and yaw < 360:
			translation += Vector3((yaw-270)/90,0,(90-(yaw-270))/90)
	return translation

func jump():
	if(Input.is_key_pressed(KEY_SPACE)):
		for i in range(0, get_colliding_bodies().size()):
			if (get_colliding_bodies()[i].get_name() == "Environement"): 
				apply_impulse(Vector3(0,0,0),Vector3(0,300,0))

func toggleLadder():
	if(Input.is_key_pressed(KEY_L)):
		var test = get_node("..").checkLadder()
		if test != null:
			get_node("../ladderPlay").toggle(test.get_translation(),get_rotation())

func checkLadder():
	if(get_translation().x < get_node("../ladderPlay").get_translation().x+2 and get_translation().x > get_node("../ladderPlay").get_translation().x-2):
		if (get_translation().z < get_node("../ladderPlay").get_translation().z+2 and get_translation().z > get_node("../ladderPlay").get_translation().z-2):
			if (get_translation().y < get_node("../ladderPlay").get_translation().y+8):
				return true
	return false
