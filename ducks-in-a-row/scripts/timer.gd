class_name TimerLabel extends Label

@export var time_alloted_seconds: int
var start_time: int

func _ready() -> void:
	start_time = Time.get_ticks_msec()

func _physics_process(_delta: float) -> void:
	var time_elapsed = Time.get_ticks_msec() - start_time
	var time_remaining = time_alloted_seconds * 1000 - time_elapsed
	
	if time_remaining <= 0:
		AudioManager.play_sound(AudioManager.alarm, false, -10)
		PlayerData.reset()
		SceneLoader.load_level(PlayerData.current_level)
	
	if (time_remaining / 1000) % 60 < 10:
		text = str(time_remaining / 60000) + ":0"
	else:
		text = str(time_remaining / 60000) + ":"
	text += str((time_remaining / 1000) % 60)

func stop() -> void:
	set_physics_process(false)
