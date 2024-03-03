extends CanvasLayer




func _on_continue_button_pressed():
	unpaused()
	get_tree().current_scene.show()

func unpaused():
	hide()
	get_tree().paused = false
	


func _on_reload_button_pressed():
	get_tree().reload_current_scene()
	unpaused()


func _on_option_button_pressed():
	pass # Replace with function body.


func _on_goback_button_pressed():
	unpaused()
	get_tree().change_scene_to_file("res://Menu/level_selector/level_selector.tscn")
