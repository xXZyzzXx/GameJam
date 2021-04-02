extends KinematicBody2D

var velo = Vector2()
var flor = Vector2(0, -1)
export (int) var speed
export (int) var gravity
var jump = 120



func _physics_process(delta):
	velo.y += gravity
	var mouse = get_local_mouse_position()
	if Input.is_action_just_pressed("click"):
		velo.x = mouse.x

