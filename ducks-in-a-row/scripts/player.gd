class_name Player extends CharacterBody2D

var player_scene: PackedScene = load("res://scenes/baby.tscn")
var module: Player
var max_distance: float = 20
var is_head = true
@export var sprite: Sprite2D
@export var light: PointLight2D
var last_position: Vector2
var killable = true
var virtual_mouse: Vector2
var mouse_strength: float = 0.3

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	var level = get_parent()
	virtual_mouse = Vector2(100, 100)
	if level and level is LevelManager:
		virtual_mouse = level.start_pos
	if !is_head:
		killable = false
		await get_tree().create_timer(1).timeout
		killable = true

func _process(delta: float) -> void:
	if is_head:
		velocity = (virtual_mouse - position) / delta
		move_and_slide()
	if module:
		snap_module()
	flip_sprite()

func _input(event: InputEvent) -> void:
	if is_head and event.is_action_pressed("quack"):
		AudioManager.play_sound(AudioManager.quack, true, 0)
		if PlayerData.game_complete():
			play_baby_sound()
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		virtual_mouse += event.relative * mouse_strength
		virtual_mouse = virtual_mouse.clamp(Vector2.ZERO, get_viewport_rect().size)

func play_baby_sound() -> void:
	if !is_head:
		await get_tree().create_timer(randf_range(0.01,0.3)).timeout
		AudioManager.play_sound(AudioManager.baby_duck_sound, true, 0)
	if module:
		module.play_baby_sound()

func flip_sprite() -> void:
	var movement = position - last_position
	if abs(movement).x > 1:
		sprite.flip_h = movement.x > 0
	last_position = position

func set_body() -> void:
	is_head = false

func snap_module() -> void:
	var direction: Vector2 = (module.position - position).normalized()
	module.position = position + (direction * max_distance)

func add_module() -> void:
	if module:
		module.add_module()
	else:
		var new_module = player_scene.instantiate() as Player
		new_module.set_body()
		new_module.light.visible = self.light.visible
		var level = get_parent()
		if level and level is LevelManager:
			new_module.position = level.start_pos
		get_tree().get_current_scene().add_child(new_module)
		module = new_module

func remove_module() -> void:
	if module:
		module.remove_module()
	else:
		if is_head:
			self.kill()
		else:
			self.queue_free()

func kill() -> void:
	AudioManager.play_sound(AudioManager.quack, true, 0)
	PlayerData.reset()
	SceneLoader.load_level(PlayerData.current_level)
