extends KinematicBody2D

export (int) var speed = 300

var velo = Vector2()
var target = Vector2()
var get = 0

# Необходимо сделать передвижение только по оси х. 
# Определить, вправо или влево повернутуть персонажа и сделать $Sprite.flip_h 

func _physics_process(delta):
	var mous = get_local_mouse_position()
	if mous.x < 0:
		get = -300
	elif mous.x > 0:
		get = 300
	else:
		get = 0
	if Input.is_action_just_pressed("click"):
		velo.x = get
	else:
		velo.x = 0

func _process(delta):
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
