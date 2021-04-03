extends TextureButton



func _on_exit_pressed():
	get_parent().get_node("AnimationPlayer").play("close")
