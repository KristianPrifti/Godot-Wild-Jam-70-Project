extends Node2D

var slime = preload("res://slime_mini.tscn")

# initial player position
var player_pos = Vector2(300, 550)

func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_slime():
	var s = slime.instantiate()
	$enemies.add_child((s))
	s.position = Vector2(1645, 790)
	
	var s2 = slime.instantiate()
	$enemies.add_child((s2))
	s2.position = Vector2(1645, 309)
	


func _on_timer_timeout():
	spawn_slime()

func level():
	pass
