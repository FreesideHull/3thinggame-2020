extends KinematicBody2D

const FIREBALL = preload("res://witchbroomstickcat/Test/Fireball.tscn")

var speed = 200
var facing_right = true
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
func get_input():
	velocity = Vector2()
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	if Input.is_action_pressed("up"):
		velocity.y -= Input.get_action_strength("up")
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("down"):
		velocity.y += Input.get_action_strength("down")
		$AnimationPlayer.play("Run")
	else:
		$AnimationPlayer.play("Idle")
	
	if Input.is_action_just_pressed("fire"):
		var fireball = FIREBALL.instance()
		get_parent().add_child(fireball)
		fireball.position = $FireballOrigin.global_position
	
	velocity.x += 1
	
	velocity = velocity.normalized() * speed


func take_damage() -> void:
	pass
	#PlayerData.lives -= 1
	#queue_free()
