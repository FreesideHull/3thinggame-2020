extends Control


onready var score_label: Label = $Score
onready var score_lives: Label = $Lives


func _ready():
	pass # Replace with function body.

func update_interface() -> void:
	score_label.text = "Score: %s" % 0
	score_lives.text = "Lives: %s" % 0
