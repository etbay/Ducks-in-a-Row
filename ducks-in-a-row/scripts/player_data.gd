# PlayerData - Autoload
extends Node

signal duck_collected()

var ducks_collected: int
var current_level: int
var levels_complete: Dictionary[int, bool] = {
	1: false,
	2: false,
	3: false,
	4: false,
	5: false,
	6: false
}

func game_complete() -> bool:
	for i in levels_complete.values():
		if !i:
			return false
	return true

func reset() -> void:
	ducks_collected = 0

func inc_ducks() -> void:
	ducks_collected += 1
	duck_collected.emit()
