extends CanvasLayer


var followingScene = ""
var currentScene = ""

onready var player = $"/root/SceneChanger/AnimationPlayer"
onready var gui = $"/root/Gui"

func _ready():
	var root = get_tree().get_root()
	currentScene = root.get_child(root.get_child_count() - 1)
	player.play("fade")


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		Gui.get_node("Control").hide()
		goto_scene("res://MainMenu.tscn")
		#quitGame()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		quitGame()

func quitGame():
	# saveGame()
	get_tree().quit()

func goto_scene(path):
	gui._clear_selected_item()
	followingScene = path
	player.playback_speed = 2
	player.play_backwards()

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	currentScene.free()

	# Load the new scene.
	print(path)
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	currentScene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(currentScene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(currentScene)
	
	player.play()


func _on_AnimationPlayer_animation_finished(_anim_name):
	if followingScene != "":
		call_deferred("_deferred_goto_scene", followingScene)
	followingScene = ""
