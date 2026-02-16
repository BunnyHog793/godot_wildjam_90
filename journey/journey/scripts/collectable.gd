extends CharacterBody2D
class_name collectable




func _on_button_button_down() -> void:
	
	GlobalSignals.rock_collected.emit(5)
	die()

func die():
	queue_free()
