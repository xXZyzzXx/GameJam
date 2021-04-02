extends Camera2D


func _ready():
	_auto_set_limits()
	

func _auto_set_limits():
	limit_left = 0
	limit_right = 1280
	var current_scene_size = GameData.current_scene.rect_size
	# print(current_scene_size)
	limit_right = max(current_scene_size.x, limit_right)
