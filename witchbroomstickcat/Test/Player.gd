extends KinematicBody2D

var speed = 200
var facing_right = true
var velocity = Vector2()
var bossfight = false

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


func get_input():
	velocity = Vector2()
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	if bossfight != true:
		velocity.x += 1
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		$AnimationPlayer.play("Run")
	
	elif Input.is_action_pressed("down"):
		velocity.y += 1
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("right"):
		velocity.x += 1
		$AnimationPlayer.play("Run")
	else:
		$AnimationPlayer.play("Idle")
	
	velocity = velocity.normalized() * speed


