extends Control


var scene

func _on_creditsButton_pressed():
	scene = "res://witchbroomstickcat/Credits/Credits.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_StartGameButton_pressed():
	scene = "res://witchbroomstickcat/Test/World.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	
func _on_backButton_pressed():
	scene = "res://witchbroomstickcat/Titlescreen/titlescreen.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene)
