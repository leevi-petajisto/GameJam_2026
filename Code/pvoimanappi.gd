extends Area2D

@onready var corridor_a: Area2D = $"../Käytävä1"
@onready var corridor_b: Area2D = $"../Käytävä2"
@onready var button_area: Area2D = $"."

func _ready() -> void:
	button_area.body_entered.connect(_on_button_pressed)

func _on_button_pressed(body: Node2D) -> void:
	if body is Kroko:
		var gravity_a := corridor_a.gravity
		corridor_a.gravity = corridor_b.gravity
		corridor_b.gravity = gravity_a
