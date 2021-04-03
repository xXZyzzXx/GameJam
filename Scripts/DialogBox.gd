extends Control


onready var close_timer = get_node("Timer")
onready var anim_player = get_node("AnimationPlayer")
onready var label = get_node("Bg/HBox/Control/Label")
onready var dialog_icon = get_node("Bg/HBox/Bg/Icon")
onready var hint = get_node("HintBg")
onready var default_icon = load("res://Data/Assets/player_icon.png")
var close_by_skip = false
var current_tree = null 
var existed_dialog_tree = null  # Оставшиеся диалоги
var current_dialog = null
var open_new_dialog = true
# Передать список слов в диалог с скипанием и ван шоты, которые пропадают сами

# Called when the node enters the scene tree for the first time.
func _ready():
	hint.hide()
	close_timer.one_shot = true
	close_timer.connect("timeout", self, "_timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
			
func _input(event):
	if event.is_action_pressed('skip'):
		if current_dialog:
			close_dialog()
		if current_tree:
			_get_next_dialog_from_tree()

		
func show_dialog(text, image=null, time=1.5):
	if current_tree or current_dialog == text:
		if current_dialog == text:
			close_timer.start()
		return
	if current_dialog:
		open_new_dialog = false
	if time == 0:
		close_by_skip = true
	else:
		close_timer.wait_time = time
		close_timer.start()
		
	var dialog_list = Data.dialogs.get(text)
	if dialog_list:
		var phrase = dialog_list.duplicate(true)[0]
		current_dialog = text
		label.text = str(phrase.get("text"))
		dialog_icon.texture = (Data.icons.get(phrase.get("speaker"))).get("texture")
	else:
		current_dialog = text
		label.text = str(text)
		if image:
			dialog_icon.texture = image
		else:
			dialog_icon.texture = default_icon
	if open_new_dialog:
		open_dialog()
		
func show_dialog_tree(dialog):
	var dialog_list = Data.dialogs.get(dialog)
	current_dialog = null
	current_tree = dialog_list.duplicate(true)
	existed_dialog_tree = dialog_list.duplicate(true)
	open_dialog()
	_get_next_dialog_from_tree()
	
func _get_next_dialog_from_tree():
	if len(existed_dialog_tree) > 0:
		var phrase = existed_dialog_tree[0]
		label.text = str(phrase.get("text"))
		dialog_icon.texture = (Data.icons.get(phrase.get("speaker"))).get("texture")
		existed_dialog_tree.erase(phrase)
	else:
		close_dialog()

func open_dialog():
	if current_tree:
		hint.show()
	else:
		hint.hide()
	anim_player.play("open")
	
func close_dialog():
	#if current_dialog and existed_dialog_tree:
		#return  # На всякий случай заглушка от произвольного закрытия
	current_dialog = null
	current_tree = null 
	existed_dialog_tree = null
	open_new_dialog = true
	anim_player.play("close")
	
func _timeout():
	if current_dialog:
		close_dialog()


func _on_Bg_pressed():
	Gui._clear_selected_item()
	if current_tree:
		_get_next_dialog_from_tree()
	if current_dialog:
		close_dialog()
