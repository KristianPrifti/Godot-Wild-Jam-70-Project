extends Node2D

@onready var g1 = get_node("enemies/Goblin1")
@onready var g2 = get_node("enemies/Goblin2")
@onready var s1 = get_node("enemies/Skeleton1")
@onready var s2 = get_node("enemies/Skeleton2")
@onready var s3 = get_node("enemies/Skeleton3")
@onready var s4 = get_node("enemies/Skeleton4")

# initial player position
var player_pos = Vector2(165, 960)

# variabled to keep bounds for movement
var x_min_s1 = 1750
var y_min_s1 = 250
var x_max_s1 = 1750
var y_max_s1 = 250

var x_min_s2 = 165
var y_min_s2 = 210
var x_max_s2 = 165
var y_max_s2 = 210

var x_min_s3 = 500
var y_min_s3 = 210
var x_max_s3 = 1200
var y_max_s3 = 210

var x_min_s4 = 600
var y_min_s4 = 890
var x_max_s4 = 1450
var y_max_s4 = 890

var x_min_g1 = 1750
var y_min_g1 = 850
var x_max_g1 = 1750
var y_max_g1 = 850

var x_min_g2 = 600
var y_min_g2 = 550
var x_max_g2 = 1200
var y_max_g2 = 550


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos
	
	s1.set_bounds(x_min_s1, y_min_s1, x_max_s1, y_max_s1)
	s2.set_bounds(x_min_s2, y_min_s2, x_max_s2, y_max_s2)
	s3.set_bounds(x_min_s3, y_min_s3, x_max_s3, y_max_s3)
	s4.set_bounds(x_min_s4, y_min_s4, x_max_s4, y_max_s4)
	g1.set_bounds(x_min_g1, y_min_g1, x_max_g1, y_max_g1)
	g2.set_bounds(x_min_g2, y_min_g2, x_max_g2, y_max_g2)
	
	s1.set_health(4)
	s2.set_health(4)
	s3.set_health(4)
	s4.set_health(4)
	g1.set_health(3)
	g2.set_health(3)

	g1.get_node("AnimatedSprite2D").flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()

func level():
	pass
