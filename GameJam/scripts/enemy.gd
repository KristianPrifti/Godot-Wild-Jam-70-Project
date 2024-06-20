extends CharacterBody2D

# keep track which direction it moves
var direction
# bounds
var min_x = 9999
var min_y = 9999
var max_x = 9999
var max_y = 9999
# keep track if enemy is dead
var dead

var speed = 200

var health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !dead:
		if direction:
			velocity = (Vector2(max_x, max_y) - position).normalized() * speed * delta 
			if position.x > max_x || position.y > max_y:
				direction = !direction
		else:
			velocity = (Vector2(min_x, min_y) - position).normalized() * speed * delta 
			if position.x < min_x || position.y < min_y:
				direction = !direction
		
		if velocity.length() == 0:
			get_node("AnimatedSprite2D").play("idle")
		else:
			if direction:
				get_node("AnimatedSprite2D").flip_h = false
			else:
				get_node("AnimatedSprite2D").flip_h = true
			get_node("AnimatedSprite2D").play("run")
		
		move_and_collide(velocity)

'''set_bounds and set_health MUST be called when adding an enemy to the level'''
func set_bounds(x1, y1, x2, y2):
	min_x = x1
	min_y = y1
	max_x = x2
	max_y = y2

func set_health(h):
	health = h

func set_direction(d):
	direction = d

func enemy():
	pass
