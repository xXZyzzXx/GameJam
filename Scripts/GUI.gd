extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var inv_btn = get_node("InventoryBtn")
onready var inventory_player = get_node("Inventory/AnimationPlayer")
onready var gui_timer = get_node("Timer")
onready var inventory = get_node("Inventory")

onready var selected_item_from_slot = get_node("SelectedItem")
var current_mouse_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	selected_item_from_slot.hide()
	_gui_init()
	inv_btn.connect("inventory_pressed", self, "_on_inventory_pressed")
	for s in inventory.slots:
		s.connect("slot_pressed", self, "_on_slot_pressed")
	
	
func _input(event):
	if event is InputEventMouseMotion:
		current_mouse_pos = event.position
		if GameData.selected_item:
			var mouse_pos = _get_item_offset(selected_item_from_slot, event.position) 
			selected_item_from_slot.rect_position = mouse_pos
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			if event.pressed:
				GameData.selected_item = null
				selected_item_from_slot.texture = null
				selected_item_from_slot.hide()
	
func _gui_init():
	gui_timer.wait_time = 0.5
	gui_timer.one_shot = true
	gui_timer.connect("timeout", self, "_timeout")
	gui_timer.start()

func _get_item_offset(itempos, mousepos):
	return Vector2(mousepos.x - itempos.rect_size.x, mousepos.y) 
	
func _timeout():
	inventory_player.play("Fade-Out")
	GameData.is_inventory_open = true

func _on_inventory_pressed():
	if GameData.is_inventory_open:
		inventory_player.play("Fade-In")
		GameData.is_inventory_open = false
	else:
		inventory_player.play("Fade-Out")
		GameData.is_inventory_open = true
		
func _on_slot_pressed(item):
	print('Slot pressed: ', item)
	if item:
		GameData.selected_item = item
		selected_item_from_slot.texture = GameData.all_items.get(item).get("texture")
		selected_item_from_slot.rect_position = _get_item_offset(selected_item_from_slot, current_mouse_pos)
		selected_item_from_slot.show()
	else:
		GameData.selected_item = null
		selected_item_from_slot.texture = null
		selected_item_from_slot.hide()
