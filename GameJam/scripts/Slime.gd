extends CharacterBody2D

'''Enemy movement varibles'''

var speed = 100
var player_in_range = false
var player = null

'''Enemy Combat Varible'''

var health = 50
var dead = false


func _ready():
	dead = false #sets the dead varibles to false as the game launches
	
'''Enemy Movement'''	
func _physics_process(delta):
	if !dead:
		# flip in the correct direction
		if GLOBAL.player.position.x < self.position.x:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
			
		$"detection"/CollisionShape2D.disabled = false #if the enemy is not dead, do not disable thier detection zone
		$"hitbox"/CollisionShape2D.disabled = false
		if player_in_range && (self.get_global_position() - player.get_global_position()).length()  > 70 : #if the player is in range of the enemy's detection zone.
			velocity = (player.get_global_position() - position).normalized() * speed * delta 
			
			#the enimes velocity is the player's position/direction - the enemies position/direction
			#mutiplied by the speed of the enemy
			$AnimatedSprite2D.play("Jump")
		else:
			velocity = lerp(velocity, Vector2.ZERO, .07) #if the player is not in range, the velocity slowly drops to 0
			$AnimatedSprite2D.play("Idle")
		move_and_collide(velocity)
	if dead:
		$"detection"/CollisionShape2D.disabled = true #if dead, disable thier detection radius
		
'''Detections'''

func _on_detection_body_entered(body): #checks if the player enters the detection zone
	if body.has_method("player"):
		player_in_range = true
		player = body

func _on_detection_body_exited(body):  #checks if the player leaves the detection zone
	if body.has_method("player"):
		player_in_range = false 

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
	$AnimatedSprite2D.play("Death")
	await $AnimatedSprite2D.animation_finished
	GLOBAL.end_game_w()
	queue_free()
	
func Slime():
	pass
