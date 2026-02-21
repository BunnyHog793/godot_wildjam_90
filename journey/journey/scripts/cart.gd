extends CharacterBody2D
class_name cart

@onready var line: Line2D = $Line2D

@export var start : Marker2D

@export var hp : int = 10

@export var coal : int = 5

@export var wood : int = 5
@export var rock : int = 5

@export var speed : int = 100 

@export var gravity : int = 10
@export var jump_hight : int = 2
@export var number_of_jumps : int = 2
@export var max_clamp : int = 350

var jump_number = 0
var clicked = false
var mouse_start_loc = Vector2.ZERO
var mouse_vector = Vector2.ZERO

func _ready() -> void:
	GlobalSignals.connect("rock_collected", add_rock)
	GlobalSignals.connect("jump_upgraded", jump_upgraded)
	GlobalSignals.connect("speed_upgraded", speed_upgrade)
	GlobalSignals.connect("size_upgraded", size_upgraded)
	

func _physics_process(_delta: float) -> void:
	
	#print(velocity.x)
	velocity.y += gravity
	move_and_slide()
	
	
	if clicked:
		#line.position = position
		#line.set_point_position(0, position)
		line.set_point_position(1, get_local_mouse_position())
		pass
		#mouse_vector = get_global_mouse_position() - mouse_start_loc
		#print(mouse_vector)
	
	# reset jump count
	if is_on_floor():
		#velocity.x = speed
		jump_number = 0

func die():
	pass
	

func size_upgraded():
	print("size bigger!")
	pass

func jump_upgraded():
	if rock >= 5:
		print("more jumps!!!! yeah")
		number_of_jumps += 1
		add_rock(-5)
	
	
func speed_upgrade():
	print("lets go faster!!!!")
	speed += 50
	pass
	
	
func jump():
	if jump_number < number_of_jumps:
		velocity.y = mouse_vector.y * jump_hight
		velocity.x = mouse_vector.x * jump_hight
		jump_number += 1
	else:
		pass
	
func hit(amnt) -> void:
	hp -= amnt
	if hp < 1:
		die()

func add_coal(new_coal : int) -> void:
	coal += new_coal

func add_wood (new_wood : int) -> void:
	wood += new_wood

func add_rock(new_coal : int) -> void:
	rock += new_coal
	GlobalSignals.update_rock.emit(rock)

func reset_to_start() -> void:
	position = start.global_position
	pass


	

func _on_button_button_down() -> void:
	mouse_start_loc = get_global_mouse_position()
	
	line.add_point(to_local(position), 0)
	line.add_point(get_local_mouse_position(), 1)
	#jump()
	print("oiii")
	clicked = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("World_boundry"):
		print("failed")
		reset_to_start()
	pass # Replace with function body.



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		#if body.is_class("obstacle"):
		print("ahahah enemy!")


func _on_button_button_up() -> void:
	mouse_vector = get_global_mouse_position() - mouse_start_loc
	mouse_vector = mouse_vector * Vector2(-1,-1)
	mouse_vector.x = clamp(mouse_vector.x, -max_clamp, max_clamp)
	mouse_vector.y = clamp(mouse_vector.y, -max_clamp, max_clamp)
	print(mouse_vector)
	line.clear_points()
	jump()
	clicked = false
