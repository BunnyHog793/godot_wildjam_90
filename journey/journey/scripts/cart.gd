extends CharacterBody2D
class_name cart

@export var hp : int = 10

@export var coal : int = 5

@export var wood : int = 5
@export var rock : int = 5

@export var speed : int = 1
@export var gravity : int = 10
@export var jump_hight : int = 500

func _ready() -> void:
	GlobalSignals.connect("rock_collected", add_rock)
	pass
	
	
func _physics_process(_delta: float) -> void:
	velocity.x += speed
	velocity.y += gravity
	move_and_slide()

	
	
func die():
	pass
	
	
func upgrade():
	pass
	
	
func jump():
	if is_on_floor():
		velocity.y = -jump_hight
	else:
		pass
	
func hit():
	pass

func add_coal(new_coal : int) -> void:
	coal += new_coal

func add_wood (new_wood : int) -> void:
	wood += new_wood

func add_rock(new_coal : int) -> void:
	rock += new_coal
	print(rock)


func _on_button_button_down() -> void:
	jump()
