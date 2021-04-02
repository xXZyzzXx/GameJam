extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim_player = get_node("AnimationPlayer")
onready var notification_label = get_node("Notification/Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	Gui.get_node("Control").hide()
	if GameData.saved_game:
		GameData.load_data()


func _on_game_saved():
	notification_label.text = "Game saved!"
	anim_player.play("fade-in")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade-in":
		anim_player.play("fade-out")
