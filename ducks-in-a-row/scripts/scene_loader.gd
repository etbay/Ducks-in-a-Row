# SceneLoader - Autoload
extends Node

var main_menu: PackedScene = preload("res://scenes/main_menu.tscn")
var levels: Dictionary[int, PackedScene] = {
	1: preload("res://scenes/level_one.tscn"),
	2: preload("res://scenes/level_two.tscn"),
	3: preload("res://scenes/level_three.tscn"),
	4: preload("res://scenes/level_four.tscn"),
	5: preload("res://scenes/level_five.tscn"),
	6: preload("res://scenes/level_six.tscn"),
	7: preload("res://scenes/level_seven.tscn")
}

func load_scene(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed.call_deferred(scene)

func load_level(index: int) -> void:
	get_tree().change_scene_to_packed.call_deferred(levels[index])
