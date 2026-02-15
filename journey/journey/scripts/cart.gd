extends CharacterBody2D


@export var hp : int = 10

@export var coal : int = 5

@export var wood : int = 5

@export var speed : int = 10


func _ready() -> void:
	pass
	
	
func _physics_process(_delta: float) -> void:
	position.x += speed
	pass
	
	
func die():
	pass
	
	
func upgrade():
	pass
	
	
func jump():
	pass
	
func hit():
	pass

func add_coal(new_coal : int) -> void:
	coal += new_coal

func add_wood (new_wood : int) -> void:
	wood += new_wood
