extends Node


var is_inventory_open = true
var selected_item = null
var first_launch = true
var disable_gui = true
var saved_game = false
var current_scene


var all_items = {
	"Tech": {"texture": load("res://Data/Icons/tech.png")},
	"Gear": {"texture": load("res://Data/Icons/gear.png")},
}

var inventory_slots = {
	"1": null,
	"2": null,
	"3": null,
	"4": null,
	"5": null,
	"6": null,
}

func _ready():
	pass # Replace with function body.


func save_data():
	var data = {
		"inventory_slots": inventory_slots,
	}
	var file = File.new()
	var encrypt_key = OS.get_unique_id()
	file.open_encrypted_with_pass("user://save.json", File.WRITE, encrypt_key)
	file.store_string(to_json(data))
	file.close()
	saved_game = true

func load_data():
	var file = File.new()
	if not file.file_exists("user://save.json"):
		return
	var encrypt_key = OS.get_unique_id()
	file.open_encrypted_with_pass("user://save.json", File.READ, encrypt_key)
	var data = parse_json(file.get_as_text())
	inventory_slots = data.get("inventory_slots")
