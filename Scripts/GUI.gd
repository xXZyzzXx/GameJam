extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var inv_btn = get_node("InventoryBtn")
onready var inventory_player = get_node("Inventory/AnimationPlayer")
onready var gui_timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	inv_btn.connect("inventory_pressed", self, "_on_inventory_pressed")
	_gui_init()
	

func _gui_init():
	gui_timer.wait_time = 0.5
	gui_timer.one_shot = true
	gui_timer.connect("timeout", self, "_timeout")
	gui_timer.start()

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
