extends Node#

var timer = 1000.0
var spawn_delay = 1
var can_spawn = true
var enemycount = 0


func _ready():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://witchbroomstickcat/Test/Enemy.tscn")
	var world = load("res://witchbroomstickcat/Test/world.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(spawn_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
	while (can_spawn == true):
			for i in range(0, 5):
				var enemy = enemyscene.instance()
				var x = rand.randf_range(1280, 1408)
				rand.randomize()
				var y = rand.randf_range(64, 672)
				enemy.position.y =   y
				enemy.position.x =  enemy.position.x  + 100 + x
				add_child(enemy)
				can_spawn = false
				timer.start()



func on_timeout_complete():
	can_spawn = true
	timer = 100.0
	_ready()
