extends AudioStreamPlayer
@onready var timer = $Timer

func _ready():
	timer.connect("timeout",start_music)



func start_music():
	if Pausedmenu.visible:
		timer.start(randi_range(20,30))
	else:
		play()
		



func _on_finished():
	timer.start(randi_range(20,60))
