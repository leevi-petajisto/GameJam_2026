extends Area2D

const FILE_BEGIN = "res://Scenes/Levels/level_"
var can_teleport = false
var player_body = null


func _process(_delta):
	# Check if player is in area AND presses action button
	if can_teleport and Input.is_action_just_pressed("Pipe_Enter"):
		if player_body:
			teleport()

func teleport():
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)

func _on_body_entered(body):
	# Assumes player is in a group named "Player"
	if body.is_in_group("Player"):
		can_teleport = true
		player_body = body

func _on_body_exited(body):
	if body.is_in_group("Player"):
		can_teleport = false
		player_body = null
