extends Node

var timer = null
var spawn_delay = 1
var can_spawn = true

func _ready():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://witchbroomstickcat/Test/Enemy.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(spawn_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
	if(can_spawn == true):
		for i in range(0, 3):
			var enemy = enemyscene.instance()
			var x = rand.randf_range(1280, 1408)
			rand.randomize()
			var y = rand.randf_range(64, 672)
			enemy.position.y = y
			enemy.position.x = x
			add_child(enemy)
		
		can_spawn = false
		timer.start()


func on_timeout_complete():
	can_spawn = true
