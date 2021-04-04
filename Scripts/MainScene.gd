extends Control


onready var player = get_node("Player")
onready var left_wall = get_node("Left_wall")
onready var right_wall = get_node("Right_wall")

onready var trash = get_node("Trash")
onready var sea_window = get_node("Sea_window")
onready var ventil = get_node("Ventil")

onready var lift_door = get_node("Lift_door")
onready var hall_door = get_node("Hall_door")
onready var security_door = get_node("Security_door")


# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.x = 870
	player.get_node("Sprite").flip_h = true
	GameData.first_launch = false
	pass # Replace with function body.


func _on_Left_wall_pressed():
	player.move_to_object(left_wall)

func _on_Right_wall_pressed():
	player.move_to_object(right_wall)
	
func _on_Sea_window_pressed():
	print("sea_window pressed")
	player.move_to_object(sea_window)

func _on_Trash_pressed():
	print("trash pressed")
	player.move_to_object(trash)

func _on_Lift_door_pressed():
	print("lift_door pressed")
	player.move_to_object(lift_door)

func _on_Security_door_pressed():
	player.move_to_object(security_door)

func _on_Hall_door_pressed():
	player.move_to_object(hall_door)

func _on_Ventil_pressed():
	player.move_to_object(ventil)
