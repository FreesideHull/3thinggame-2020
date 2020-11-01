extends Node

signal score_update
signal lives_update
signal progress_update
signal boss_health_update

var levelprogress = 0 setget set_progress
var score = 0 setget set_score
var lives = 3 setget set_lives
var boss_health = 1000 setget set_boss_health
var position = Vector2()

func reset():
	self.score = 0
	self.lives = 3
	self.levelprogress = 0
	self.boss_health = 10000
	self.position = Vector2()
	
func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("score_update")

func set_boss_health(new_score: int) -> void:
	boss_health = new_score
	emit_signal("boss_health_update")

func set_progress(progress: int) -> void:
	levelprogress = progress
	emit_signal("progress_update")

func set_lives(new_value: int) -> void:
	lives = new_value
	emit_signal("lives_update")
