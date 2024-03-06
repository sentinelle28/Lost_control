extends AnimationPlayer

class_name Cutscene

@export var skip_lenght = 0.5

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

func _process(_delta):
	if is_playing() and Input.is_action_just_pressed("ui_accept"):
		advance(skip_lenght)
