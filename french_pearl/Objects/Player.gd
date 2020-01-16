extends KinematicBody2D

# Declare member variables here. Examples:
const STATE_NOT_PLAYING = 0
const STATE_PLAYING = 1
const STATE_DEAD = 2

var velocity = Vector2()
export var gravity = 10
export var jump_strength = 4.0
var spr
var play_state

# Called when the node enters the scene tree for the first time.
func _ready():
	spr = get_child(0)
	play_state = STATE_PLAYING

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("Fire"):
		if play_state == STATE_PLAYING:
			velocity.y = -jump_strength
		else:
			get_tree().reload_current_scene()
	
	spr.rotation_degrees = (velocity.y / gravity) * 45
	
	var collision = move_and_collide(velocity)
	if collision:
		play_state = STATE_DEAD
		velocity = collision.normal