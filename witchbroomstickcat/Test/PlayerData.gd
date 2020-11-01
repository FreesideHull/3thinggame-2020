extends Node

signal score_update
signal lives_update

var score = 0 setget set_score
var lives = 3 setget set_lives
var x
var y

func reset():
	self.score = 0
	self.lives = 3

func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("score_update")
	
func set_y(new_y: int) -> void:
	y = y

func set_lives(new_value: int) -> void:
	lives = new_value
	emit_signal("lives_update")
