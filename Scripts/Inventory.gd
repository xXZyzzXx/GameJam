extends Control


onready var grid = get_node("Scroll/Grid")

onready var slot1 = get_node("Scroll/Grid/Slot1")
onready var slot2 = get_node("Scroll/Grid/Slot2")
onready var slot3 = get_node("Scroll/Grid/Slot3")
onready var slot4 = get_node("Scroll/Grid/Slot4")
onready var slot5 = get_node("Scroll/Grid/Slot5")
onready var slot6 = get_node("Scroll/Grid/Slot6")

onready var slots = [slot1, slot2, slot3, slot4, slot5, slot6]


func _ready():
	update_slots()
	
func update_slots():
	var i = 0
	for item in GameData.inventory_slots:
		var slot_content = GameData.inventory_slots.get(item)
		var icon = slots[i].get_node("Icon")
		if slot_content:
			var content_item = GameData.all_items.get(slot_content)
			icon.texture = content_item.get("texture")
			slots[i].item = slot_content
		else:
			icon.texture = null
			slots[i].item = null
		i += 1
