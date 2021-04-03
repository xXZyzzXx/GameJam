extends Node


var icons = {
	"player": {"texture": load("res://Data/Icons/gear.png")},
	"enemy": {"texture": load("res://Data/Icons/tech.png")},
	"something": {"texture": load("res://Data/Assets/player.png")},
	"sea_window": {"texture": load("res://Data/Assets/Items/sea_window.png")},
}

var dialogs = {
	"greeting": [
		{"speaker": "player", "text": "sdsdfshfiudwfwee"}, 
		{"speaker": "enemy", "text": "fhedfeofehfiehf"}, 
		{"speaker": "player", "text": "fdewfxeasenuihfd32uif234lkjfb34jfb4jlkf"}, 
		{"speaker": "something", "text": "d3df33"},
	],
	"Окно с видом на океан": [
		{"speaker": "sea_window", "text": "Окно с видом на океан.."},
		{"speaker": "player", "text": "Когда я успела залезть в эту историю по уши?"},
		{"speaker": "player", "text": "Неужели нельзя было спокойно пить пиво у себя дома.."},
	],
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
