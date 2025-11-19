extends Button

func _ready() -> void:
	self.pressed.connect(was_pressed)

func was_pressed() -> void:
	SceneLoader.load_scene(SceneLoader.main_menu)
