extends TextureButton



func _on_Open_pressed():
	get_parent().get_node("Node2D/AnimationPlayer").play("open")
	if get_parent().get_n
