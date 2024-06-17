extends CharacterBody2D

'''Player Movement Varibles'''

var SPEED = 300

var input_vector = Vector2(0,0)
var last_input_vector = Vector2(0,0)

@onready var animation_node = $AnimatedSprite2D
#animation to play
var anim

var is_atk: bool = false

func _ready():
	$AnimatedSprite2D.play("idle_front")

func _physics_process(delta):
	
	if !is_atk:
		input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
		input_vector.x += Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y += Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		input_vector = input_vector.normalized()
		
		# move if you need to
		if input_vector:
			velocity = input_vector * SPEED
			move_and_slide()
			last_input_vector = input_vector
		
		# play the correct animation
		anim = get_animation(input_vector)
		animation_node.play(anim)
	
	else:
		anim = get_animation(input_vector)
		anim = check_for_attack(anim)
		animation_node.play(anim)
		await animation_node.animation_finished
		is_atk = false
		
	
	if Input.is_action_just_pressed("space"):
		is_atk = true

func get_animation(v):
	var x = v.x
	var y = v.y
	if x == 0 && y == 0:
		if last_input_vector.x > 0:
			animation_node.flip_h = false
			return "idle_side"
		elif last_input_vector.x < 0:
			animation_node.flip_h = true
			return "idle_side"
		elif last_input_vector.y < 0:
			return "idle_back"
		else:
			return "idle_front"
	elif x > 0:
		animation_node.flip_h = false
		return "run_side"
	elif  x < 0:
		animation_node.flip_h = true
		return "run_side"
	elif y < 0:
		return "run_back"
	elif y > 0:
		return "run_front"
	
	else:
		return "idle_front"

func check_for_attack(a):
		if a == "run_side" || a == "idle_side":
			#print(a.substr(0,5))
			return "attack_side"
		elif a == "run_front" || a == "idle_front":
			return "attack_front"
		elif a == "run_back" || a == "idle_back":
			return "attack_back"



func player():
	pass
