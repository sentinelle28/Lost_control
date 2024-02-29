extends Node

class_name PlayerInputManager

var input_name:String
var is_usable:bool = true
	
func _init(name_of_the_input):
	input_name = name_of_the_input
	
func change_input_mode(value):
	is_usable = value
		
func can_use_input():
	return Input.is_action_just_pressed(input_name) and is_usable
