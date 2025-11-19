extends Control

@export var main_buttons: Control
@export var button_theme: Theme

func _ready() -> void:
	var next_level_added: bool = false
	for i in PlayerData.levels_complete.keys():
		if PlayerData.levels_complete[i]:
			var button: LoadLevelButton = LoadLevelButton.new()
			button.level_index = i
			button.text = "Level " + str(i)
			add_child(button)
			#button.theme = button_theme
		else:
			if !next_level_added:
				var button: LoadLevelButton = LoadLevelButton.new()
				button.level_index = i
				button.text = "Level " + str(i)
				add_child(button)
				next_level_added = true

func _input(event: InputEvent) -> void:
	if  self.visible and event.is_action_pressed("escape"):
		self.visible = false
		main_buttons.visible = true
