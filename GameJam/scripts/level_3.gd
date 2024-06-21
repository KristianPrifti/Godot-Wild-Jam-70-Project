extends Node2D

@onready var g1 = get_node("enemies/Goblin1")
@onready var g2 = get_node("enemies/Goblin2")
@onready var g3 = get_node("enemies/Goblin3")
@onready var g4 = get_node("enemies/Goblin4")
@onready var s1 = get_node("enemies/Skeleton1")
@onready var s2 = get_node("enemies/Skeleton2")
@onready var s3 = get_node("enemies/Skeleton3")

# initial player position
var player_pos = Vector2(250, 690)

# variabled to keep bounds for movement
var x_min_s1 = 1220
var y_min_s1 = 480
var x_max_s1 = 1220
var y_max_s1 = 480

var x_min_s2 = 1220
var y_min_s2 = 560
var x_max_s2 = 1220
var y_max_s2 = 560

var x_min_s3 = 865
var y_min_s3 = 520
var x_max_s3 = 1100
var y_max_s3 = 520

var x_min_g1 = 850
var y_min_g1 = 210
var x_max_g1 = 1130
var y_max_g1 = 210

var x_min_g2 = 850
var y_min_g2 = 830
var x_max_g2 = 1130
var y_max_g2 = 830

var x_min_g3 = 685
var y_min_g3 = 290
var x_max_g3 = 685
var y_max_g3 = 290

var x_min_g4 = 685
var y_min_g4 = 765
var x_max_g4 = 685
var y_max_g4 = 765


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos
	
	s1.set_bounds(x_min_s1, y_min_s1, x_max_s1, y_max_s1)
	s2.set_bounds(x_min_s2, y_min_s2, x_max_s2, y_max_s2)
	s3.set_bounds(x_min_s3, y_min_s3, x_max_s3, y_max_s3)
	g1.set_bounds(x_min_g1, y_min_g1, x_max_g1, y_max_g1)
	g2.set_bounds(x_min_g2, y_min_g2, x_max_g2, y_max_g2)
	g3.set_bounds(x_min_g3, y_min_g3, x_max_g3, y_max_g3)
	g4.set_bounds(x_min_g4, y_min_g4, x_max_g4, y_max_g4)
	
	s1.set_health(4)
	s2.set_health(4)
	s3.set_health(4)
	g1.set_health(3)
	g2.set_health(3)
	g3.set_health(3)
	g4.set_health(3)
	
	# flip emeny in the right direction
	g3.get_node("AnimatedSprite2D").flip_h = true
	g4.get_node("AnimatedSprite2D").flip_h = true
	s1.get_node("AnimatedSprite2D").flip_h = true
	s2.get_node("AnimatedSprite2D").flip_h = true

# if the pkayer reaches the door they pass the level
func _on_door_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()


func level():
	pass
