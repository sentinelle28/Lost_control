extends ProgressBar

@export var timer:Timer
@export var audio:AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout",change_input)
	timer.start(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	value = timer.time_left

func change_input():
	Inputprinter.update_input()
	audio.play()
	timer.start(15)
