extends TextureButton


func _on_Button1_pressed():
	get_parent().Name += '1'
	print(get_parent().Name)
