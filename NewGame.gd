extends Control

var scene

func _ready():
	$VBoxContainer/HBoxContainer/VBoxContainer/StartGameButton.grab_focus()
	
func _on_StartGameButton_pressed():
	scene = "res://witchbroomstickcat/Test/World.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene)
