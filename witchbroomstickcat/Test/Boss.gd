extends KinematicBody2D

const speed = 1
var velocity = Vector2()
var attackPos: Vector2;
var is_dead = false
var attacking = false;
var originalPosition: Vector2;

var started = false;

func _ready():
	#$Timer.start(10)
	originalPosition = position;
	pass
	
func hit():
	if !is_dead:
		PlayerData.boss_health -= 10
		PlayerData.score += 10
		if PlayerData.boss_health <= 0:
			dead();
		
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
#	$AnimatedSprite.play("dead")

func attack_toggle():
	attackPos = PlayerData.position

	attacking = !attacking;
	return;
	
var t = 0.0

func _physics_process(_delta):
	if attacking && attackPos != null:
		if t == 1:
			t = 0.0
		t += _delta * 0.1
		position = position.linear_interpolate(attackPos, t)
	elif started:
		if t == 1:
			t = 0.0
		t += _delta * 0.1
		var playerPos = PlayerData.position;
		playerPos.x += 700;
		playerPos.y = 200;
		position = position.linear_interpolate(playerPos, t)
	if is_dead == true:
		get_tree().change_scene("res://witchbroomstickcat/GameOverScreen/GameOvercreen.tscn")
		
		

func _on_VisibilityNotifier2D_screen_exited():
	
	pass

func _on_VisibilityNotifier2D_viewport_entered(viewport):
	print("boss in view")
	$Timer.start(10)



func _on_Timer_timeout():
	print("timer");
	attack_toggle();
	pass # Replace with function body.


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	started = true;
	$Timer.stop();
	pass # Replace with function body.
