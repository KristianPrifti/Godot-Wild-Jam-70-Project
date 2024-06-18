extends Node

var player
var gold
var damage

func _ready():
	gold = 0
	damage = 1

func get_gold(g):
	gold += g
