extends Node

var cut_scene_counter = 1

var world
var player
var gold

var damage
var speed
var health

var health_lv
var damage_lv
var speed_lv

var rat_and_bat_killed

func _ready():
	restart()

func get_gold(g):
	gold += g

# set values to their default
func restart():
	
	cut_scene_counter = 1

	if world != null:
		world.queue_free()
	if player != null:
		player.queue_free()
	
	gold = 0
	
	health = 10
	damage = 1
	speed = 200
	
	health_lv = 1
	damage_lv = 1
	speed_lv = 1
	
	rat_and_bat_killed = 0


func end_game():
	get_tree().change_scene_to_file("res://end_scene_loss.tscn")
