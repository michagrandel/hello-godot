extends Button
class_name SceneLoaderButton

export var scenePath = ''

func _pressed():
	get_node("/root/SceneLoader").goto_scene(scenePath)
	
