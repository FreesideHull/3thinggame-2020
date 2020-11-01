extends Node

signal score_update
signal lives_update
signal progress_update
signal boss_health_update
signal where_is_y
signal where_is_x

var levelprogress = 0 setget set_progress
var score = 0 setget set_score
var lives = 3 setget set_lives
var x
var y
var boss_health = 100 setget set_boss_health

func reset():
	self.score = 0
	self.lives = 3
	self.levelprogress = 0
	self.boss_health = 100
	
func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("score_update")
	
func set_y(new_y: int) -> void:
	new_y = $Sprite.get_global_transform().y;
	emit_signal("where_is_y")
	
func set_x(new_x: int) -> void:
	new_x = $Sprite.get_global_transform().x;
	emit_signal("where_is_x")

func set_boss_health(new_score: int) -> void:
	boss_health = new_score
	emit_signal("boss_health_update")

func set_progress(progress: int) -> void:
	levelprogress = progress
	emit_signal("progress_update")

func set_lives(new_value: int) -> void:
	lives = new_value
	emit_signal("lives_update")
