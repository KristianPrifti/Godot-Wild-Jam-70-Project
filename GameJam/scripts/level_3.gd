extends Node2D

var player_pos = Vector2(120, 300)

var exit_d1 = Vector2(985, 970)
var exit_d2 = Vector2(1560, 60)
var exit_d3 = Vector2(1210, 450)
var exit_d4 = Vector2(990, 450)
var exit_d5 = Vector2(750, 170)
var exit_d5_part_2 = Vector2(630, 160)

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
		GLOBAL.player.position = exit_d5_part_2

func _on_door_5_part_2_body_entered(body):
	if body.name == "Player":
		GLOBAL.player.position = exit_d5

func _on_door_6_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()



