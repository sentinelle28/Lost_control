extends Button

@export var level_to_load:String = "res://level/tutoriel.tscn"




func _on_pressed():
	Inputprinter.show()
	get_tree().change_scene_to_file(level_to_load)
