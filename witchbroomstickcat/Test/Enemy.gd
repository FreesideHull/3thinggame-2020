extends KinematicBody2D

const speed = 1
var velocity = Vector2()

func _ready():
	pass

func _physics_process(_delta):
	velocity.x -= speed
	$AnimatedSprite.play("move")
	
	velocity = move_and_slide(velocity)
