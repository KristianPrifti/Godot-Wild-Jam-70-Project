extends Node2D

@onready var g1 = get_node("enemies/Goblin1")
@onready var g2 = get_node("enemies/Goblin2")
@onready var g3 = get_node("enemies/Goblin3")

# initial player position
var player_pos = Vector2(500, 880)

# variabled to keep bounds for movement
var x_min1 = 310
var y_min1 = 310
var x_max1 = 700
var y_max1 = 310
var x_min2 = 165
var y_min2 = 160
var x_max2 = 165
var y_max2 = 450

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos
	g1.set_bounds(x_min1, y_min1, x_max1, y_max1)
	g2.set_bounds(x_min2, y_min2, x_max2, y_max2)
	g3.set_bounds(690, 885, 690, 885)
	g1.set_health(3)
	g2.set_health(3)
	g3.set_health(3)

# if the pkayer reaches the door they pass the level
func _on_door_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()


func level():
	pass
