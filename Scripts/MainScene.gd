extends Control


onready var player = get_node("Player")
onready var trash = get_node("Trash")
onready var lift_door = get_node("Lift_door")
onready var sea_window = get_node("Sea_window")


# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.first_launch = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Trash_pressed():
	print("trash pressed")
	player.move_to_object(trash)


func _on_Lift_door_pressed():
	print("lift_door pressed")
	player.move_to_object(lift_door)


func _on_Sea_window_pressed():
	print("sea_window pressed")
	player.move_to_object(sea_window)
