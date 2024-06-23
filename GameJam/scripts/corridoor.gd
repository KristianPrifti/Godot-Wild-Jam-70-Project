extends Node2D

# initial player position
var player_pos = Vector2(105, 445)

func _ready():
	if GLOBAL.player != null:
		GLOBAL.player.position = player_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func level():
	pass


func _on_door_body_entered(body):
	if body.name == "Player":
		GLOBAL.world.load_next_scene()
