extends CharacterBody2D
class_name Knight

@export var _speed : float = 100
@export var _jump_velocity : float = 200
@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



#region Inputs variables
var _horizontal_input : float = 0
var _is_jumping : bool = false
var _jump_counter : float = 0

#endregion


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump"):
		_is_jumping = true


func _process(_delta: float) -> void:
	_horizontal_input = Input.get_axis("Move_Left", "Move_Right")


func _physics_process(delta: float) -> void:
	# 1. Lisää painovoima
	_apply_gravity(delta)
	# 2. Reagoi hyppyyn
	_handle_jump()
	# 3. Reagoi liikkeeseen
	_handle_move()
	# 4. Päivitä animaatiot
	_update_animations()
	# 5. Välitä tiedot fysiikka moottorille
	move_and_slide()

func _apply_gravity(delta : float) -> void:
	if not is_on_floor(): 
		velocity += get_gravity() * delta

func _handle_jump() -> void:
	if _is_jumping and _jump_counter == 0:
		velocity.y = -_jump_velocity
		_is_jumping = false
		_jump_counter += 1
	if is_on_floor():
		_jump_counter = 0 
	
func _handle_move() -> void:
	if is_zero_approx(_horizontal_input):
		velocity.x = move_toward(velocity.x, 0, _speed)
	else:
		velocity.x = _horizontal_input * _speed
		_animated_sprite_2d.flip_h = velocity.x < 0

func _update_animations() -> void:
	if Input.is_action_just_pressed("Jump"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("jump")
		#Halusimme hyppyanimaation pyörivän vain tuplahypyssä
	if is_on_floor() and velocity.x == 0:
		$AnimatedSprite2D.play("idle")
	if is_on_floor() and velocity.x != 0 and _is_jumping == false:
		$AnimatedSprite2D.play("move")
