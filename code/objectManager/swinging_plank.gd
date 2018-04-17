extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var anim = get_node("AnimationPlayer2").get_animation("ArmatureAction")
	anim.set_loop(true)
	get_node("AnimationPlayer2").play("ArmatureAction")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
