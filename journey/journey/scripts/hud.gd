extends Control


@onready var rock_label: Label = %Rock_label

@onready var upgrade_spped: Button = %"upgrade spped"
@onready var upgrade_jump: Button = %"upgrade jump"
@onready var upgrade_size: Button = %"upgrade size"



func _ready() -> void:
	GlobalSignals.connect("update_rock", update_rock)
	
	
	
## update the rock label
func update_rock(value : int) -> void:
	rock_label.text = str(value)


func _on_upgrade_spped_pressed() -> void:
	GlobalSignals.speed_upgraded.emit()


func _on_upgrade_jump_pressed() -> void:
	GlobalSignals.jump_upgraded.emit()
	pass # Replace with function body.


func _on_upgrade_size_pressed() -> void:
	GlobalSignals.size_upgraded.emit()
	pass # Replace with function body.
