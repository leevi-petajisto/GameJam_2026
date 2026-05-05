extends Area2D

@onready var putket = $".."
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#putket.target = putket.target + 1
		if putket.target == 1:
			putket.target -= 1
		else:
			putket.target += 1
