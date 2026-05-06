extends Area2D

@onready var putket = $".."
@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#putket.target = putket.target + 1
		if putket.target == 1:
			putket.target -= 1
			_animated_sprite_2d.play("interact_1")
		else:
			putket.target += 1
			_animated_sprite_2d.play("interact_2")
