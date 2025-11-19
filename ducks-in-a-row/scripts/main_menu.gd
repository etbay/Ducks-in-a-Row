extends Node2D

@export var pickup: PackedScene

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	AudioManager.play_music(AudioManager.track_one, -20)
	for i in PlayerData.levels_complete.keys():
		if PlayerData.levels_complete[i]:
			for duck_num in GameData.level_ducks[i]:
				var duck: Pickup = pickup.instantiate()
				duck.position = Vector2(randf_range(30, 550), randf_range(30, 280))
				add_child(duck)
