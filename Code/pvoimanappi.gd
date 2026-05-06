extends Area2D

@onready var corridor_a: Area2D = $"Käytävä1"
@onready var corridor_b: Area2D = $"Käytävä2"
@onready var button_area: Area2D = $"."
@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var nappi_state : bool = true

func _ready() -> void:
	button_area.body_entered.connect(_on_button_pressed)

func _on_button_pressed(body: Node2D) -> void:
	if body is Kroko:
		var gravity_a := corridor_a.gravity
		corridor_a.gravity = corridor_b.gravity
		corridor_b.gravity = gravity_a


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if nappi_state == true:
			_animated_sprite_2d.play("interact_1")
			nappi_state = false
		else:
			_animated_sprite_2d.play("interact_2")
			nappi_state = true
