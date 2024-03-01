extends Area2D

var is_player_in = false
@export var current_level = 0


func _input(event):
	if event.as_text() == "enter":
		if current_level != 0:
			if current_level+1 in LevelUnlock:
				LevelUnlock.level[current_level+1] = true
			get_tree().change_scene_to_file("res://Menu/level_selector/level_selector.tscn")
		else:
			get_tree().change_scene_to_file("res://level/true_tutoriel.tscn")




func _on_body_entered(body):
	if "player" in body.name:
		$Label.show()
		


func _on_body_exited(body):
	if "player" in body.name:
		$Label.hide()
		
