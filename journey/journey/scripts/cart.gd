extends CharacterBody2D
class_name cart

@export var hp : int = 10

@export var coal : int = 5

@export var wood : int = 5
@export var rock : int = 5

@export var speed : int = 100
@export var gravity : int = 10
@export var jump_hight : int = 500
@export var number_of_jumps : int = 2

var jump_number = 0

func _ready() -> void:
	GlobalSignals.connect("rock_collected", add_rock)
	pass
	
	
func _physics_process(_delta: float) -> void:
	velocity.x = speed + rock
	#print(velocity.x)
	velocity.y += gravity
	move_and_slide()
	
	# reset jump count
	if is_on_floor():
		jump_number = 0

func die():
	pass
	
	
func upgrade():
	pass
	
	
func jump():
	if jump_number < number_of_jumps:
		velocity.y = -jump_hight
		jump_number += 1
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
	#print(rock)


func _on_button_button_down() -> void:
	jump()
