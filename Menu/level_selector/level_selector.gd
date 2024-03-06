extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var children_list = $Panel/VBoxContainer.get_children()
	for i in range(children_list.size()):
		if i-1 in LevelUnlock.level:
			if LevelUnlock.level[i-1]:
				children_list[i].show()
			else:
				children_list[i].hide()
