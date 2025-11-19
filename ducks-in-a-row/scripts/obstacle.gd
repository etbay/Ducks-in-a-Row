class_name Obstacle extends Area2D

func _ready() -> void:
	self.body_entered.connect(Callable(self, "_body_entered"))

func _body_entered(body: Node2D) -> void:
	if body is Player:
		if body.killable:
			body.kill()
