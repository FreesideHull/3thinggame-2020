extends Control

onready var score_label: Label = $Score
onready var score_lives: Label = $Lives
var score = 0


func _ready():
	PlayerData.connect("score_update", self, "update_interface")
	PlayerData.connect("lives_update", self, "update_interface")

	update_interface()


func update_interface() -> void:
	score_label.text = "Score: %s" % PlayerData.score
	score_lives.text = "Lives: %s" % PlayerData.lives
