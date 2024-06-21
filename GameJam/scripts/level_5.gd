extends Node2D

var rat = preload("res://rat.tscn")
var bat = preload("res://bat.tscn")
# initial player position
var player_pos = Vector2(1365, 330)

var x_min_r = 1
var y_min_r = 220
var x_max_r = 1200
var y_max_r = 220

var x_min_b = 1
var y_min_b = 455
var x_max_b = 1200
var y_max_b = 455

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass


func spawn_rat():
	var r = rat.instantiate()
	$enemies.add_child((r))
	r.position = Vector2(120, 220)
	r.set_bounds(x_min_r, y_min_r, x_max_r, y_max_r)
	r.set_health(1)
	r.direction = true

func spawn_bat():
	var b = bat.instantiate()
	$enemies.add_child((b))
	b.position = Vector2(120, 455)
	b.set_bounds(x_min_b, y_min_b, x_max_b, y_max_b)
	b.set_health(1)
	b.direction = true

# deleate the enemies if they reach the door
func _on_area_2d_body_entered(body):
	if (body.has_method("rat") || body.has_method("bat")):
		body.queue_free()


func _on_area_2d_2_body_entered(body):
	if (body.has_method("rat") || body.has_method("bat")):
		body.queue_free()

func _on_timer_timeout():
	spawn_rat()


func _on_timer_2_timeout():
	spawn_bat()

func level():
	pass
