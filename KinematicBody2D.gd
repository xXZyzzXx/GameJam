extends KinematicBody2D

export (int) var speed = 300

var velocity = Vector2()
var target = Vector2()

# Необходимо сделать передвижение только по оси х. 
# Определить, вправо или влево повернутуть персонажа и сделать $Sprite.flip_h 

func _input(event):
	if event.is_action_pressed("left_click"):
		target.x = get_viewport().get_mouse_position().x
		print(target, " ", position.x)

func _physics_process(delta):
	#velocity = position.direction_to(target) * speed
	#if position.distance_to(target) > 5:
	if target.x < position.x:
		$Sprite.flip_h = true
		#velocity.x = +speed
	elif target.x > position.x:
		$Sprite.flip_h = false

	#if Input.is_action_pressed("ui_left"):
	##	$Sprite.flip_h = true
	#elif Input.is_action_pressed("ui_right"):
#		velo.x = +speed
#		$Sprite.flip_h = false
##		velo.x = 0
	#move_and_slide(velo)
