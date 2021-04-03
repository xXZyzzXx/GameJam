extends KinematicBody2D

var velo = Vector2()
var speed = 300

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		velo.y = speed
	elif Input.is_action_pressed("ui_up"):
		velo.y = -speed
	else:
		velo.y = 0
	if Input.is_action_pressed("ui_left"):
		velo.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velo.x = speed
	else:
		velo.x = 0
	move_and_slide(velo)
