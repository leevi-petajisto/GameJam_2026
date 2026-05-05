extends Area2D

var can_teleport = false
var player_body = null
@export var target = 1

func _process(_delta):
	# Check if player is in area AND presses action button
	if can_teleport and Input.is_action_just_pressed("Pipe_Enter"):
		if player_body:
			teleport()

func teleport():
	# Use set_deferred to avoid physics errors
	if target == 1:
		player_body.global_position = $Destination1.global_position
	else:
		player_body.global_position = $Destination2.global_position

func _on_body_entered(body):
	# Assumes player is in a group named "Player"
	if body.is_in_group("Player"):
		can_teleport = true
		player_body = body

func _on_body_exited(body):
	if body.is_in_group("Player"):
		can_teleport = false
		player_body = null
