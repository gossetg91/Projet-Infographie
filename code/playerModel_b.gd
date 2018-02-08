extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currentPosition
var rotation_abs

func _ready():
	rotation_abs= Vector3(get_rotation_deg())
	set_process_input(true)
	set_process(true)
	pass

func _process(delta):
	translate(get_mvt())
	pass

func _input(event):
	#mouse rotation managment for rotating the camera
	if(event.type==InputEvent.MOUSE_MOTION):
		get_viewport().warp_mouse(Vector2(get_viewport().get_rect().size.x/2,get_viewport().get_rect().size.y/2));
		
		var rotation = Vector3(0.5*(event.pos.x-get_viewport().get_rect().size.x/2)  , -0.5*(event.pos.y-get_viewport().get_rect().size.y/2) ,  0)

		#vertical conversion and recalculation of Y and Z comp
		if(rotation_abs.x >= 0 && rotation_abs.x <= 90):
			print("top");
			rotation.z = rotation.y * (rotation_abs.x/90)
			rotation.y = rotation.y * ((90-rotation_abs.x)/90)
		elif(rotation_abs.x >= 90 && rotation_abs.x <=180):
			rotation.z = rotation.y * (rotation_abs.x/90)
			rotation.y = -rotation.y * ((90-rotation_abs.x)/90)
		elif(rotation_abs.x >= 180 && rotation_abs.x <= 270):
			rotation.z = -rotation.y * (rotation_abs.x/90)
			rotation.y = -rotation.y * ((90-rotation_abs.x)/90)
		elif(rotation_abs.x >= 270 && rotation_abs.x < 360):
			rotation.z = -rotation.y * (rotation_abs.x/90)
			rotation.y = rotation.y * ((90-rotation_abs.x)/90)

		rotation_abs = rotation_abs+rotation
		
		#managment of horizontal cycle
		if(rotation_abs.x > 360):
			rotation_abs.x = rotation_abs.x-360
		if(rotation_abs.x < 0):
			rotation_abs.x = rotation_abs.x+360
		if(rotation_abs.y > 360):
			rotation_abs.y = rotation_abs.y-360
		if(rotation_abs.y < 0):
			rotation_abs.y = rotation_abs.y+360
		if(rotation_abs.z > 360):
			rotation_abs.z = rotation_abs.z-360
		if(rotation_abs.z < 0):
			rotation_abs.z = rotation_abs.z+360

		print(rotation_abs)
		set_rotation_deg(Vector3(0,0,0))

		rotation=Vector3(0,0,0)

func get_mvt():
	var translation = Vector3()
	var rotationState = get_rotation_deg()
	
	#reading inputs
	if(Input.is_key_pressed(KEY_Z)):
		translation.z = translation.z-5
	if(Input.is_key_pressed(KEY_Q)):
		translation.x = translation.x-5
	if(Input.is_key_pressed(KEY_S)):
		translation.z = translation.z+5
	if(Input.is_key_pressed(KEY_D)):
		translation.x = translation.x+5

	return translation
	