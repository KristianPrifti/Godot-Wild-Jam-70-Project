extends "res://scripts/enemy.gd"

var gold_to_give = 1

func _ready():
	dead = false #sets the dead varibles to false as the game launches
	
	
'''taking damage'''
func _on_hitbox_area_entered(area):
	if area.name == "atk_right" || area.name == "atk_left" || area.name == "atk_up" || area.name == "atk_down":
		take_damage() #sends the damage dealt to the function for calculating damage


func take_damage():
	health = health - GLOBAL.damage #health is the current health - damage dealt
	if health <= 0:
		health = 0 #if health is less than or equal to 0, it is 0
	
	if health <= 0 and !dead:
		death() #cals the death function

func death(): # dies
	dead = true
	$AnimatedSprite2D.play("damaged")
	await $AnimatedSprite2D.animation_finished
	GLOBAL.get_gold(gold_to_give)
	GLOBAL.rat_and_bat_killed += 1
	queue_free()


func bat():
	pass
