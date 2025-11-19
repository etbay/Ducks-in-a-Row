class_name LevelManager extends Node2D

@export var start_pos: Vector2
@export var num_ducks: int
@export var level_num: int


func _ready() -> void:
	PlayerData.reset()
	PlayerData.current_level = level_num
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	AudioManager.play_music(AudioManager.rain_sound, -20)
	AudioManager.play_music(AudioManager.track_one, -20)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		SceneLoader.load_scene(SceneLoader.main_menu)
		PlayerData.reset()
