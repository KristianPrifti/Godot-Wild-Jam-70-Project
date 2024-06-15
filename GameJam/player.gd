extends CharacterBody2D

'''Player Movement Varibles'''

const speed = 100
var player_state

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x and direction.y == 0:
		player_state = "Idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "Walk"
	
	velocity = direction * speed
	move_and_slide()
	
	play_animation(direction)
	
func play_animation(dir):
	if player_state == "Idle":
		$AnimatedSprite2D.play("idle")	
	if player_state == "walk":
		if dir.y == -1:
			
			$AnimatedSprite2D.play("walking")
	
	
	
