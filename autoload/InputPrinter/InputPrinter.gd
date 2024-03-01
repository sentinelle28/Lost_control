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
		ListOfPossibleInput.set_input_to(input_pick[i],true)
		
	for elt in ListOfPossibleInput.get_already_pick_input():
		ListOfPossibleInput.set_input_to(elt,false)

	for elt in input_pick:
		ListOfPossibleInput.set_input_to(elt,true)
		
	for i in range(3):
		InputMap.action_erase_events(list_of_input[i])
		InputMap.action_add_event(list_of_input[i],input_pick[i])
		
	actualise_input()
