extends Node2D

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout",change_input)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/ProgressBar.value = timer.time_left

func change_input():
	Inputprinter.update_input()
	$AudioStreamPlayer.play()
	timer.start(15)
