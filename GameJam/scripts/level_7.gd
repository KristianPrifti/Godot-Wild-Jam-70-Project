extends Node2D

# initial player position
var player_pos = Vector2(22, 170)

var exit_d1 = Vector2(168, 640)
var exit_d2 = Vector2(1368, 740)
var exit_d3 = Vector2(1416, 785)
var exit_d4 = Vector2(1895, 70)
var exit_d5 = Vector2(75, 1028)
var exit_d6 = Vector2(1133, 597)

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos
	
	# flip emeny in the right direction
	$shop.get_node("AnimatedSprite2D").flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()


func _on_door_1_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d2

func _on_door_2_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d1

func _on_door_3_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d4


func _on_door_4_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d3


func _on_door_5_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d6


func _on_door_6_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d5


func _on_door_7_body_entered(body):
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos

func level():
	pass
