extends AnimationPlayer

class_name Cutscene

func _ready():
	connect("animation_finished",on_finished)

func activate():
	PlayerInputAutoload.set_all_input_to(false)
	Inputprinter.hide()
	play("cutscene")
	 
	
func on_finished(anim_name):
	if anim_name != "RESET":
		PlayerInputAutoload.set_all_input_to(true)
		play("RESET")
		Inputprinter.show()

