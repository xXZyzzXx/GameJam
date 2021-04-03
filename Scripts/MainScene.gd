extends Control


onready var player = get_node("Player")
onready var trash = get_node("Trash")


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
