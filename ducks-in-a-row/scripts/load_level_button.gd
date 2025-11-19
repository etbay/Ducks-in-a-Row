class_name LoadLevelButton extends Button

var level_index: int

func _ready() -> void:
	self.pressed.connect(was_pressed)

func was_pressed() -> void:
	SceneLoader.load_level(level_index)

func set_index(index: int) -> void:
	level_index = index
