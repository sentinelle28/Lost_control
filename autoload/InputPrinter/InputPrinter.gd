extends CanvasLayer

var list_of_label = []
var list_of_input = ["jump","move_left","move_right"]
# Called when the node enters the scene tree for the first time.
func _ready():
	list_of_label.append_array([$VBoxContainer/Label,$VBoxContainer/HBoxContainer/Label,$VBoxContainer/HBoxContainer/Label2])
	InputMap.load_from_project_settings()
	actualise_input()


func actualise_input():
	for i in range(len(list_of_input)):
		var events = InputMap.action_get_events(list_of_input[i])
		if events.size() > 0:
			list_of_label[i].text = events[0].as_text().trim_suffix(" (Physical)")

func update_input():
	var possible_input = ListOfPossibleInput.get_possible_input()
	var input_pick = []
	for i in range(3):
		input_pick.append(possible_input.pick_random())
		ListOfPossibleInput.set_input_to(input_pick[i].name_of_the_input,true)
		
	for elt in ListOfPossibleInput.get_already_pick_input():
		ListOfPossibleInput.set_input_to(elt.name_of_the_input,false)

	for elt in input_pick:
		ListOfPossibleInput.set_input_to(elt.name_of_the_input,true)
		
	for i in range(3):
		InputMap.action_erase_events(list_of_input[i])
		
		var temp = InputEventKey.new()
		temp.set_keycode(dict[input_pick[i].name_of_the_input])
		InputMap.action_add_event(list_of_input[i],temp)
		
	actualise_input()
	
var dict = {"A": 65,"B"  : 66,"C" : 67,"D" : 68,"E" : 69,"F" : 70,"G" : 71,"H" : 72,
"I" : 73,"J" : 74,"K" : 75,"L" : 76,"M" : 77,
"N" : 78,"O" : 79,"P" : 80,"Q" : 81,"R" : 82,"S" : 83,"T" : 84,"U" : 85,
"V" : 86,"W" : 87,"X" : 88,"Y" : 89,"Z" : 90}
