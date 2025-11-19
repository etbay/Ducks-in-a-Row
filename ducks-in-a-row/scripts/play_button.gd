extends Button

@export var level_select: Control

func _ready() -> void:
	self.pressed.connect(was_pressed)

func was_pressed() -> void:
	self.visible = false
	level_select.visible = true
