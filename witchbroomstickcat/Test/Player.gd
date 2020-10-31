extends KinematicBody2D

const FIREBALL = preload("res://witchbroomstickcat/Test/Fireball.tscn")

var speed = 200
var facing_right = true
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

var collided = false;

var can_shoot = true;

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if !collided:
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			print("Collided with: ", collision.collider.name)
			if collision.collider.name == "Enemy2":
				collided = true;
				can_shoot = false;
				$CollisionShape2D.disabled = true;
				PlayerData.lives -= 1
				print("timeout start")
				$Sprite.modulate = Color(1, 1, 1, 0.5)
				yield(get_tree().create_timer(0.5),"timeout")
				print("timeout done")
				$Sprite.modulate = Color(1, 1, 1, 1)
				yield(get_tree().create_timer(0.5),"timeout")
				$Sprite.modulate = Color(1, 1, 1, 0.5)
				yield(get_tree().create_timer(0.5),"timeout")
				$Sprite.modulate = Color(1, 1, 1, 1)
				$CollisionShape2D.disabled = false;
				collided = false;
				can_shoot = true;
			
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
	
	if Input.is_action_just_pressed("fire") && can_shoot:
		var fireball = FIREBALL.instance()
		get_parent().add_child(fireball)
		fireball.position = $FireballOrigin.global_position
	
	velocity.x += 1
	
	velocity = velocity.normalized() * speed
	



func take_damage() -> void:
	pass
	#PlayerData.lives -= 1
	#queue_free()
