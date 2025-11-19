class_name Pickup extends Area2D

func _ready() -> void:
	self.body_entered.connect(Callable(self,"_body_entered"))

func _body_entered(body: Node2D) -> void:
	if body is Player:
		PlayerData.inc_ducks()
		AudioManager.play_sound(AudioManager.baby_duck_sound, true, 0)
		body.call_deferred("add_module")
		self.queue_free()
