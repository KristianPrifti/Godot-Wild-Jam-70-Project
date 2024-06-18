extends CharacterBody2D

var direction = false
var speed = 100
var min_x
var max_x
var min_y
var max_y
var health = 1
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	min_x = position.x
	max_x = position.x
	min_y = position.y
	max_y = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# move the enemy
	if direction:
		velocity = (Vector2(max_x, max_y) - position).normalized() * speed * delta 
		if position.x > max_x || position.y > max_y:
			direction = !direction
	else:
		velocity = (Vector2(min_x, min_y) - position).normalized() * speed * delta 
		if position.x < min_x || position.y < min_y:
			direction = !direction
	move_and_collide(velocity)

# set initial bounds
func move_to_from(x1, y1, x2, y2):
	min_x = x1
	max_x = x2
	min_y = y1
	max_y = y2



func enemy():
	pass
