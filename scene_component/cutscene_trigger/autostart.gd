extends Node

@export var cutscene:Cutscene
# Called when the node enters the scene tree for the first time.
func _ready():
	cutscene.activate()

