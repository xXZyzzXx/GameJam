extends Control


onready var close_timer = get_node("Timer")
onready var anim_player = get_node("AnimationPlayer")
onready var label = get_node("Bg/HBox/Control/Label")
onready var dialog_icon = get_node("Bg/HBox/Bg/Icon")
onready var default_icon = load("res://Data/Assets/call_icon.webp")
var close_by_skip = false
var current_tree = null 
var existed_dialog_tree = null  # Оставшиеся диалоги
var current_dialog = null
# Передать список слов в диалог с скипанием и ван шоты, которые пропадают сами

# Called when the node enters the scene tree for the first time.
func _ready():
	close_timer.one_shot = true
	close_timer.connect("timeout", self, "_timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _gui_input(event):
	if event.is_action_pressed('left_click'):
		Gui._clear_selected_item()
		if current_tree:
			_get_next_dialog_from_tree()
			
func _input(event):
	if event.is_action_pressed('skip'):
		print('skip')
		if current_dialog:
			close_dialog()
		if current_tree:
			_get_next_dialog_from_tree()
		
		
func show_dialog(text, time=1):
	if current_tree:
		return
	if time == 0:
		close_by_skip = true
	else:
		close_timer.wait_time = time
		close_timer.start()
	current_dialog = text
	label.text = str(text)
	dialog_icon.texture = default_icon
	anim_player.play("open")
		
func show_dialog_tree(dialog):
	var dialog_list = Data.dialogs.get(dialog)
	current_dialog = null
	current_tree = dialog_list.duplicate(true)
	existed_dialog_tree = dialog_list.duplicate(true)
	anim_player.play("open")
	_get_next_dialog_from_tree()
	
func _get_next_dialog_from_tree():
	if len(existed_dialog_tree) > 0:
		var phrase = existed_dialog_tree[0]
		label.text = str(phrase.get("text"))
		dialog_icon.texture = (Data.characters.get(phrase.get("speaker"))).get("texture")
		existed_dialog_tree.erase(phrase)
	else:
		close_dialog()
	
func close_dialog():
	if current_dialog and existed_dialog_tree:
		return  # На всякий случай заглушка от произвольного закрытия
	current_dialog = null
	current_tree = null 
	existed_dialog_tree = null
	anim_player.play("close")
	
func _timeout():
	if current_dialog:
		close_dialog()
