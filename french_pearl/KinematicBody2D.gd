extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player and player.play_state == player.STATE_PLAYING:
		move_and_slide(Vector2.LEFT*200)