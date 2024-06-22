extends Node2D

# array that keeps the scenes in order
var scenes = [
	preload("res://cut_scene.tscn"),
	preload("res://level_1.tscn"),
	preload("res://cut_scene.tscn"),
	preload("res://level_2.tscn"),
	preload("res://cut_scene.tscn"),
	preload("res://level_3.tscn"),
	preload("res://cut_scene.tscn"),
	preload("res://level_4.tscn"),
	preload("res://cut_scene.tscn"),
	preload("res://level_5.tscn"),
	preload("res://cut_scene.tscn"),
	preload("res://level_6.tscn"),
]

var curr_scene
var scene_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.world = self
	load_first_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GLOBAL.player != null:
		get_node("CanvasLayer/stats/HP").text = "HP: " + str(GLOBAL.health)
		get_node("CanvasLayer/stats/Gold").text = "Gold: " + str(GLOBAL.gold)
		get_node("CanvasLayer/stats/Damage").text = "Damage: " + str(GLOBAL.damage)
	else:
		$CanvasLayer.visible = false

# function that loads the next scene
func load_next_scene():
	curr_scene.queue_free()
	scene_count += 1
	var s = scenes[scene_count].instantiate()
	curr_scene = s
	add_child(s)
	move_child(s, 0)
	is_level(s)

func load_first_scene():
	var s = scenes[scene_count].instantiate()
	add_child(s)
	curr_scene = s
	move_child(s, 0)
	is_level(s)

# hide the player and stats if the scene is not a level
func is_level(s):
	if s.has_method("level"):
		$Player.visible = true
		$CanvasLayer.visible = true
	else:
		$Player.visible = false
		$CanvasLayer.visible = false


