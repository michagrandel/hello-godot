extends Label
class_name VersionLabel

func _ready():
	var version = get_node("/root/ProjectInformation").version()
	self.text = self.text.format({"version":version})
