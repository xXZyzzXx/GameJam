extends Area2D

export (String) var scene

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene(scene)
