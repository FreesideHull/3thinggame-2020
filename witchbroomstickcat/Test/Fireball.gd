extends Area2D
extends Playerdata

const speed = 300
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity.x = speed * delta
	translate(velocity)
	$AnimatedSprite.play("shoot")
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	

func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
		PlayerData.score += 100
		
	queue_free()
