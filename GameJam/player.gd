extends CharacterBody2D

'''Player Movement Varibles'''

const speed = 100
var current_direction = 'none'

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("right"):
		current_direction = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		current_direction = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("down"):
		current_direction = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		current_direction = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(move):
	var dir = current_direction
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = true 
		if move == 1:
			anim.play("Walk_Right")
		elif move == 0:
			anim.play("Idle_Right")
	if dir == "left":
		if move == 1:
			anim.play("Walk_Left")
		elif move == 0:
			anim.play("Idle_Left")
	if dir == "up":
		if move == 1:
			anim.play("back walk")
		elif move == 0:
			anim.play("static.back")
	if dir == "down":
		if move == 1:
			anim.play("front walk")
		elif move == 0:
			anim.play("static.front")
