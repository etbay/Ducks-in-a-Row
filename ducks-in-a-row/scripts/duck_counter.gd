extends HBoxContainer

var duck_sprite: CompressedTexture2D = preload("res://assets/Sprite-0004.png")
var ducks: Array[TextureRect]

func _ready() -> void:
	PlayerData.duck_collected.connect(display_duck)
	var level_manager = get_tree().current_scene
	if level_manager is LevelManager:
		for i in range(level_manager.num_ducks):
			var image: TextureRect = TextureRect.new()
			image.texture = duck_sprite
			image.custom_minimum_size = duck_sprite.get_size() * 3
			image.modulate = image.modulate.darkened(0.8)
			ducks.push_front(image)
			add_child(image)

func display_duck() -> void:
	ducks[0].modulate = ducks[0].modulate.lightened(1)
	ducks.pop_front()
