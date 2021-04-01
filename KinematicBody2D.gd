extends KinematicBody2D

var velo = Vector2()
var flor = Vector2(0, -1)
export (int) var speed
export (int) var gravity
var jump = 120

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velo.x = -speed
	else:
		velo.x = 0
	move_and_slide(velo)
