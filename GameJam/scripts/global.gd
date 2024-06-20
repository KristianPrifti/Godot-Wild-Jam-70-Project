extends Node

var world
var player
var gold

var damage
var speed
var health

var health_lv
var damage_lv
var speed_lv

func _ready():
	gold = 0
	
	health = 10
	damage = 1
	speed = 200
	
	health_lv = 1
	damage_lv = 1
	speed_lv = 1

func get_gold(g):
	gold += g
