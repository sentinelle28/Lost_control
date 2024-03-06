extends Area2D

var is_player_in = false
@export var current_level = 0
@export var level_to_unlock = 1
@export var scene_to_load:String ="res://Menu/level_selector/level_selector.tscn"

func _input(event):
	if event.as_text() == "Enter" and is_player_in:
		if current_level != level_to_unlock:
			LevelUnlock.level[level_to_unlock] = true
			Inputprinter.hide()
			get_tree().change_scene_to_file(scene_to_load)
		else:
			get_tree().change_scene_to_file(scene_to_load)




func _on_body_entered(body):
	if "player" in body.name:
		$Label.show()
		is_player_in = true
		


func _on_body_exited(body):
	if "player" in body.name:
		$Label.hide()
		is_player_in = false
		
