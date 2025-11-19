# AudioManager - Autoload
extends Node

var baby_duck_sound: AudioStreamMP3 = preload("res://assets/baby_duck.mp3")
var quack: AudioStreamMP3 = preload("res://assets/quack.mp3")
var alarm: AudioStreamMP3 = preload("res://assets/alarm.mp3")
var rain_sound: AudioStreamMP3 = preload("res://assets/rain.mp3")
var track_one: AudioStreamOggVorbis = preload("res://assets/song.ogg")

func play_sound(sound: AudioStream, change_pitch: bool, volume: float) -> void:
	var audio_player: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
	add_child(audio_player)
	audio_player.stream = sound
	audio_player.volume_db = volume + 10
	if change_pitch:
		audio_player.pitch_scale = randf_range(0.8, 1.2)
	audio_player.play()
	await audio_player.finished
	audio_player.queue_free()

func play_music(song: AudioStream, volume: float) -> void:
	var playing_tracks = get_children()
	for track: AudioStreamPlayer2D in playing_tracks:
		if track.stream == song:
			return
	var audio_player: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
	add_child(audio_player)
	audio_player.stream = song
	audio_player.volume_db = volume
	audio_player.play()
