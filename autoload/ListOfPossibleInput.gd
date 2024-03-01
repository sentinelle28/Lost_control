extends Node


var input = [
PossibleInput.new("A"),PossibleInput.new("B"),PossibleInput.new("C"),
PossibleInput.new("D"),PossibleInput.new("E"),PossibleInput.new("F"),
PossibleInput.new("G"),PossibleInput.new("H"),PossibleInput.new("I"),
PossibleInput.new("J"),PossibleInput.new("K"),PossibleInput.new("L"),
PossibleInput.new("M"),PossibleInput.new("N"),PossibleInput.new("O"),
PossibleInput.new("P"),PossibleInput.new("Q"),PossibleInput.new("R"),
PossibleInput.new("S"),PossibleInput.new("T"),PossibleInput.new("U"),
PossibleInput.new("V"),PossibleInput.new("W"),PossibleInput.new("X"),
PossibleInput.new("Y"),PossibleInput.new("Z")]

func get_possible_input():
	var possible_input = []
	for p_input in input:
		if p_input.is_pick == false:
			possible_input.append(p_input)
	return possible_input

func set_input_to(input_searched:String,value:bool):
	for p_input in input:
		if p_input.name_of_the_input == input_searched:
			p_input.is_pick = value

func get_already_pick_input():
	var pick_input = []
	for input_p in input:
		if input_p.is_pick == true:
			pick_input.append(input_p)
	return pick_input
