@tool
extends Control


@export var text_to_show:String
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Panel/HBoxContainer/Label.text = text_to_show
