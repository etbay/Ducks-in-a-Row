extends Area2D

@export var click_sprite: Sprite2D
@export var timer: TimerLabel

func _ready() -> void:
	self.body_entered.connect(Callable(self, "_body_entered"))
	self.body_exited.connect(Callable(self, "_body_exited"))
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quack"):
		stop_timer()
		await get_tree().create_timer(2).timeout
		var level: LevelManager = get_parent()
		PlayerData.levels_complete[level.level_num] = true
		SceneLoader.load_level(level.level_num + 1)

func _body_entered(_body: Node2D) -> void:
	var level: LevelManager = get_parent()
	if PlayerData.ducks_collected >= level.num_ducks:
		click_sprite.visible = true
		set_process_input(true)

func _body_exited(_body: Node2D) -> void:
	click_sprite.visible = false

func stop_timer() -> void:
	timer.stop()
