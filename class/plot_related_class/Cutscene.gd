extends AnimationPlayer

class_name Cutscene

func _ready():
	connect("animation_finished",on_finished)

func activate():
	PlayerInputAutoload.set_all_input_to(false)
	play("cutscene")
	 
	
func on_finished(_anim_name):
	PlayerInputAutoload.set_all_input_to(true)
