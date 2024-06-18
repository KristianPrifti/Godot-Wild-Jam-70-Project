extends "res://scripts/enemy.gd"


func _ready():
	dead = false #sets the dead varibles to false as the game launches
	
	
'''taking damage'''
func _on_hitbox_area_entered(area):
	if area.name == "atk_right" || area.name == "atk_left" || area.name == "atk_up" || area.name == "atk_down":
		take_damage() #sends the damage dealt to the function for calculating damage


func goblin():
	pass

