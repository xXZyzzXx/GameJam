extends Node


var characters = {
	"player": {"texture": load("res://Data/Icons/gear.png")},
	"enemy": {"texture": load("res://Data/Icons/tech.png")},
	"something": {"texture": load("res://Data/Assets/player.png")},
}

var dialogs = {
	"greeting": [
		{"speaker": "player", "text": "sdsdfshfiudwfwee"}, 
		{"speaker": "enemy", "text": "fhedfeofehfiehf"}, 
		{"speaker": "player", "text": "fdewfxeasenuihfd32uif234lkjfb34jfb4jlkf"}, 
		{"speaker": "something", "text": "d3df33"}
	],
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
