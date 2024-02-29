extends Node2D



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Menu/level_selector/level_selector.tscn")


func _on_credit_button_pressed():
	get_tree().change_scene_to_file("res://Menu/credit_menu/credit_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
