extends Node2D

var ghost = preload("res://ghost.tscn")

# initial player position
var player_pos = Vector2(1750, 800)

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos
	
	spawn_ghost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_ghost():
	for i in GLOBAL.rat_and_bat_killed:
		var g = ghost.instantiate()
		$enemies.add_child((g))
		var rng = RandomNumberGenerator.new()
		var ran_x = rng.randi_range(300, 1000)
		var ran_y = rng.randi_range(150, 600)
		g.position = Vector2(ran_x, ran_y)


func _on_door_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()

func level():
	pass

