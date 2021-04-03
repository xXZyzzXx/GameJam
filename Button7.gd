extends TextureButton



func _on_Button7_pressed():
	if get_parent().Name == '123456':
		get_parent().get_parent().queue_free()
	else:
		get_parent().Name = ''
