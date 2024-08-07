extends CharacterBody2D

'''Player Movement Varibles'''


var input_vector = Vector2(0,0)
var last_input_vector = Vector2(0,0)

@onready var animation_node = $AnimatedSprite2D
# animation variables
var anim
var is_atk: bool = false
@export var is_taking_damage = false
@export var is_dead = false
@export var enemy_cooldown = true
@export var enemy_range = false
@export var boss_range = false

func _ready():
	GLOBAL.player = self
	$AnimatedSprite2D.play("idle_front")

func _physics_process(delta):
	
	if is_taking_damage && enemy_range:
		animation_node.play("damaged")
		await animation_node.animation_finished
		is_taking_damage = false
		pass
	#-------------if player is dead---------------#
	elif is_dead:
		animation_node.play("death")
		await animation_node.animation_finished
		GLOBAL.end_game()
		queue_free()
	elif !is_atk:
		input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
		input_vector.x += Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y += Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		input_vector = input_vector.normalized()
		
		# move if you need to
		if input_vector:
			velocity = input_vector * GLOBAL.speed
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
		get_node("atk_right/CollisionShape2Dr").disabled = true
		get_node("atk_left/CollisionShape2Dl").disabled = true
		get_node("atk_down/CollisionShape2Dd").disabled = true
		get_node("atk_up/CollisionShape2Du").disabled = true
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
			if animation_node.flip_h == false:
				get_node("atk_right/CollisionShape2Dr").disabled = false
			else:
				get_node("atk_left/CollisionShape2Dl").disabled = false
			return "attack_side"
		elif a == "run_front" || a == "idle_front":
			get_node("atk_down/CollisionShape2Dd").disabled = false
			return "attack_front"
		elif a == "run_back" || a == "idle_back":
			get_node("atk_up/CollisionShape2Du").disabled = false
			return "attack_back"


func take_damage(damage, enemy):
	if GLOBAL.health <= 0:
		GLOBAL.health = 0
		is_dead = true
	else:
		is_taking_damage = true
	
	if enemy_range and enemy_cooldown and enemy != null:
		
		GLOBAL.health = GLOBAL.health - damage
		if GLOBAL.health < 0:
			GLOBAL.health = 0
		enemy_cooldown = false
		await get_tree().create_timer(1).timeout
		enemy_cooldown = true
		take_damage(damage, enemy)
	
	if enemy == null:
		enemy_range = false
	
	
func _on_hitbox_body_entered(body):
	if body.has_method("goblin") && !body.dead:
		enemy_range = true
		take_damage(1, body)
	elif body.has_method("skeleton") && !body.dead:
		enemy_range = true
		take_damage(1, body)
	elif body.has_method("ghost") && !body.dead:
		enemy_range = true
		take_damage(1, body)
	elif body.has_method("Slime") && !body.dead:
		enemy_range = true
		take_damage(2, body)
	elif body.has_method("slime_mini") && !body.dead:
		enemy_range = true
		take_damage(1, body)
		
func _on_hitbox_body_exited(body):
	if body.has_method("goblin") && !body.dead:
		enemy_range = false
	elif body.has_method("skeleton") && !body.dead:
		enemy_range = false
	elif body.has_method("ghost") && !body.dead:
		enemy_range = false
	elif body.has_method("Slime") && !body.dead:
		enemy_range = false
	elif body.has_method("slime_mini") && !body.dead:
		enemy_range = false
		
func player():
	pass
