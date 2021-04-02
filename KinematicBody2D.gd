extends KinematicBody2D


export (int) var speed = 300

var target = Vector2()
var velocity = Vector2()
var state_machine

func _ready():
	state_machine = get_node("AnimationTree").get("parameters/playback")
	state_machine.start("idle")

func _unhandled_input(event):
	if event.is_action_pressed('left_click'):
		target = get_global_mouse_position()
		print(target)

func _physics_process(_delta):
	if target:
		if target.x < position.x:
			$Sprite.flip_h = true
			velocity.x = +speed
			
		elif target.x > position.x:
			$Sprite.flip_h = false
		if abs(target.x - position.x) > 5:
			state_machine.travel("walk")
			velocity = (target - position).normalized() * speed
			velocity = move_and_slide(Vector2(velocity.x, 0))
		else:
			state_machine.travel("idle")
	else:
		return



# Необходимо сделать передвижение только по оси х. 
# Определить, вправо или влево повернутуть персонажа и сделать $Sprite.flip_h 

#var velocity = Vector2()
#var target = Vector2()

#func _input(event):
	#if event.is_action_pressed("left_click"):
		#target.x = get_viewport().get_mouse_position().x
		#print(target, " ", position.x)

#func _physics_process(delta):
	#velocity = position.direction_to(target) * speed
	#if position.distance_to(target) > 5:
	#if target.x < position.x:
	#	$Sprite.flip_h = true
		#velocity.x = +speed
	#elif target.x > position.x:
		#$Sprite.flip_h = false

	#if Input.is_action_pressed("ui_left"):
	##	$Sprite.flip_h = true
	#elif Input.is_action_pressed("ui_right"):
#		velo.x = +speed
#		$Sprite.flip_h = false
##		velo.x = 0
	#move_and_slide(velo)
