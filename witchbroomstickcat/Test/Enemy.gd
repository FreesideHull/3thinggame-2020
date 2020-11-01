extends KinematicBody2D

const speed = 1
var velocity = Vector2()

var is_dead = false


func _ready():
	add_to_group("enemies")
	pass

func dead():
	if !is_dead:
		is_dead = true
		velocity = Vector2(0, 0)

		
func _physics_process(_delta):
	if is_dead == false:
		velocity.x -= speed
		velocity = move_and_slide(velocity)	
