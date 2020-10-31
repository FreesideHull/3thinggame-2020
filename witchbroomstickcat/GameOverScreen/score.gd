extends Control


onready var score_label: Label = $Score


func _ready():
	PlayerData.connect("score_update", self, "update_interface")

	update_interface()


func update_interface() -> void:
	score_label.text = "Score: %s" % PlayerData.score
