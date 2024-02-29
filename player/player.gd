extends CharacterBody2D

@export var coyete_time = 0.1
@onready var animtree = $AnimationTree

const SPEED = 300
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var last_direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_input()
	apply_gravity(delta)
	move_and_slide()

func vertical_input():
	"""
	A function to handle vertical input from the player
	"""
	if PlayerInputAutoload.input["jump"].can_use_input(): 
			
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif coyete_time > 0:
			coyete_time = 0
			velocity.y = JUMP_VELOCITY
			
	
	if Input.is_action_just_released("jump"):
		velocity.y *= 0.5

func apply_gravity(delta):
	"""A function to apply gravity if the player isn't on the floor
	Take:
		float: delta the current fraction of second
	
	"""
	if not is_on_floor():
		if coyete_time > 0:
			coyete_time -= delta
		velocity.y += gravity * delta
	else:
		coyete_time = 0.1
		
func horizontal_input():
	var direction
	if PlayerInputAutoload.input["move_left"].is_usable:
		direction = Input.get_axis("move_left","move_right")
		animtree["parameters/BlendSpace1D/blend_position"] = direction
	else:
		direction = 0
	set_direction(direction)
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
func set_direction(direction):
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true

func check_input():
	horizontal_input()
	vertical_input()
