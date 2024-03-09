extends Node2D


@export var list :Array[TileMap]
@export var time = 10
var timer

var child_are_visible = true
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout",change)
	timer.start(time)


func change():
	if child_are_visible:
		child_are_visible = false
		for elt in list:
			elt.hide()
	else:
		child_are_visible = true
		for elt in list:
			elt.show()
	timer.start(time)
