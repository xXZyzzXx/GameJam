extends KinematicBody2D

onready var state_machine = get_node("AnimationTree").get("parameters/playback")

export (int) var speed = 250

var target = Vector2()
var velocity = Vector2()
var object_to_move = null


func _ready():
	state_machine.start("idle")

func _unhandled_input(event):
	if event.is_action_pressed('left_click'):
		target = get_global_mouse_position()
		object_to_move = null
		#print(target)

func move_to_object(object):
	object_to_move = object
	#print(position.x, " ", object.rect_position.x, " ", object.rect_position.x + object.rect_size.x)
	if position.x > object.rect_position.x:
		if position.x < object.rect_position.x + object.rect_size.x:
			_on_reached_to_object()
		else:
			target = object.rect_position + object.rect_size
	else:
		target = object.rect_position

func _physics_process(_delta):
	if Gui.dialogbox.current_tree:
		target = null
		return
	if target:
		if target.x < position.x:
			$Sprite.flip_h = true
		elif target.x > position.x:
			$Sprite.flip_h = false
		if abs(target.x - position.x) > 5:
			state_machine.travel("walk")
			#velocity = (target - position).normalized() * speed
			#velocity = position.direction_to(target) * speed
			velocity = (Vector2(target.x, 0) - Vector2(position.x, 0)).normalized() * speed
			velocity = move_and_slide(Vector2(velocity.x, 0))
		else:
			state_machine.travel("idle")
			target = null
			if object_to_move:
				_on_reached_to_object()

func _on_reached_to_object():
	if GameData.selected_item:
		if "iterable" in object_to_move:
			print("able to iteract")
		print("with item")
	if "scene" in object_to_move:
		SceneChanger.goto_scene(object_to_move.scene)
		return
	elif "object_dialog" in object_to_move:
		if object_to_move.object_dialog:
			if Data.dialogs.get(object_to_move.object_dialog):
				Gui.dialogbox.show_dialog_tree(object_to_move.object_dialog)
			else:
				if "player_minds" in object_to_move:
					Gui.dialogbox.show_dialog(object_to_move.object_dialog, Data.icons.get("player").get("texture"))
				else:
					Gui.dialogbox.show_dialog(object_to_move.object_dialog, object_to_move.texture_normal)
	if "second_object_dialog" in object_to_move:
		object_to_move.object_dialog = object_to_move.second_object_dialog
	object_to_move = false
	

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
