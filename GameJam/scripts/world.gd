extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("CanvasLayer/stats/HP").text = "HP: " + str(GLOBAL.player.health)
	get_node("CanvasLayer/stats/Gold").text = "Gold: " + str(GLOBAL.gold)
	get_node("CanvasLayer/stats/Damage").text = "Damage: " + str(GLOBAL.damage)
