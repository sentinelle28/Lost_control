extends Node

var input = {"pause_button":PlayerInputManager.new("pause_button"),
"move_left":PlayerInputManager.new("move_left"),
"move_right":PlayerInputManager.new("move_right"),
"jump":PlayerInputManager.new("jump")}


func set_all_input_to(value:bool):
	for elt in input:
		input[elt].is_usable = value

func set_input_to(element:String,value:bool):
	input[element].is_usable = value
