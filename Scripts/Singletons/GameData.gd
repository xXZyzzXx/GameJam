extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_inventory_open = false
var current_scene 
var selected_item = null


var all_items = {
	"Tech": {"texture": load("res://Data/Icons/tech.png")},
}

var inventory_slots = {
	"1": null,
	"2": null,
	"3": null,
	"4": null,
	"5": null,
	"6": "Tech",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
