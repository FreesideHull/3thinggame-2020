extends Control


onready var score_label: Label = $Score
onready var score_lives: Label = $Lives
onready var level_progress: ProgressBar = $ProgressBar

func _ready():
	PlayerData.connect("score_update", self, "update_interface")
	PlayerData.connect("lives_update", self, "update_interface")
	PlayerData.connect("progress_update", self, "update_progress")
	
	
	update_interface()


func update_interface() -> void:
	score_label.text = "Score: %s" % PlayerData.score
	score_lives.text = "Lives: %s" % PlayerData.lives

func update_progress() -> void:
	level_progress.value = PlayerData.levelprogress
