extends CharacterBody2D

'''Enemy movement varibles'''

var speed = 50
var player_in_range = false
var player = null

'''Enemy Combat Varible'''

var health = 1
var dead = false

var anim

func _ready():
	dead = false #sets the dead varibles to false as the game launches
	var rng = RandomNumberGenerator.new()
	var ran = rng.randi_range(1, 2)
	if ran == 1:
		anim = $AnimatedSprite2D
		$AnimatedSprite2D2.visible = false
		$AnimatedSprite2D.visible = true
	elif ran == 2:
		anim = $AnimatedSprite2D2
		$AnimatedSprite2D.visible = false
		$AnimatedSprite2D2.visible = true

'''Enemy Movement'''	
func _physics_process(delta):
	if !dead:
		# flip in the correct direction
		if GLOBAL.player.position.x < self.position.x:
			anim.flip_h = true
		else:
			anim.flip_h = false
			
		$"detection_ms"/CollisionShape2D.disabled = false #if the enemy is not dead, do not disable thier detection zone
		$"hitbox_ms"/CollisionShape2D.disabled = false
		if player_in_range && (self.get_global_position() - player.get_global_position()).length()  > 70 : #if the player is in range of the enemy's detection zone.
			velocity = (player.get_global_position() - position).normalized() * speed * delta 
			
			#the enimes velocity is the player's position/direction - the enemies position/direction
			#mutiplied by the speed of the enemy
			anim.play("Jump")
		else:
			velocity = lerp(velocity, Vector2.ZERO, .07) #if the player is not in range, the velocity slowly drops to 0
			anim.play("Idle")
		move_and_collide(velocity)
	if dead:
		$"detection_ms"/CollisionShape2D.disabled = true #if dead, disable thier detection radius
		
'''Detections'''

func _on_detection_ms_body_entered(body): #checks if the player enters the detection zone
	if body.has_method("player"):
		player_in_range = true
		player = body

func _on_detection_ms_body_exited(body):  #checks if the player leaves the detection zone
	if body.has_method("player"):
		player_in_range = false 

'''taking damage'''
func _on_hitbox_ms_area_entered(area):
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
	anim.play("Death")
	await anim.animation_finished
	queue_free()
	
func slime_mini():
	pass



