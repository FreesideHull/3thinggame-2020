extends Node


signal updated


var score: = 0 setget set_score
var lives: = 3 setget set_lives

func reset():
	self.score = 0
	self.lives = 3

func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_lives(new_value: int) -> void:
	lives = new_value

