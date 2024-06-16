extends CharacterBody2D

'''Player Movement Varibles'''

var SPEED = 300

var input_vector = Vector2(0,0)
var last_input_vector = Vector2(0,0)

func _physics_process(delta):
	
	input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()
	
	# move if you need to
	if input_vector:
		velocity = input_vector * SPEED
		move_and_slide()
		last_input_vector = input_vector
	
	# play the correct animation
	var anim = get_animation(input_vector)
	$AnimatedSprite2D.play(anim)
	
	


func get_animation(v):
	var x = v.x
	var y = v.y
	if x == 0 && y == 0:
		if last_input_vector.x > 0:
			$AnimatedSprite2D.flip_h = false
			return "idle_side"
		elif last_input_vector.x < 0:
			$AnimatedSprite2D.flip_h = true
			return "idle_side"
		elif last_input_vector.y < 0:
			return "idle_back"
		else:
			return "idle_front"
	elif x > 0:
		$AnimatedSprite2D.flip_h = false
		return "run_side"
	elif  x < 0:
		$AnimatedSprite2D.flip_h = true
		return "run_side"
	elif y < 0:
		return "run_back"
	elif y > 0:
		return "run_front"
	
	else:
		return "idle_front"
#const speed = 100
#var player_state
#
#func _physics_process(delta):
	#player_movement(delta)
#
#func player_movement(delta):
	#var direction = Input.get_vector("left", "right", "up", "down")
	#
	#if direction.x and direction.y == 0:
		#player_state = "Idle"
	#elif direction.x != 0 or direction.y != 0:
		#player_state = "Walk"
	#
	#velocity = direction * speed
	#move_and_slide()
	#
	#play_animation(direction)
	#
#func play_animation(dir):
	#if player_state == "Idle":
		#$AnimatedSprite2D.play("idle")	
	#if player_state == "walk":
		#if dir.y == -1:
			#
			#$AnimatedSprite2D.play("walking")
	#
	
	
