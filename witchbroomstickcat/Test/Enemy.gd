extends KinematicBody2D

const speed = 1
var velocity = Vector2()

var is_dead = false

func _ready():
	pass

func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$AnimatedSprite.play("dead")

func _physics_process(_delta):
	if is_dead == false:
		velocity.x -= speed
		$AnimatedSprite.play("move")
	
		velocity = move_and_slide(velocity)	
