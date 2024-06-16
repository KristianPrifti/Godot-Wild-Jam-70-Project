extends CharacterBody2D



var speed = 100

var dead = false
var player_chase = false
var player = null

func _ready():
	dead = false 
	
func _physics_process(delta):
	if !dead:
		$"detection"/CollisionShape2D.disabled = false
		if player_chase:
			velocity = (player.get_global_position() - position).normalized() * speed * delta
		else:
			velocity = lerp(velocity, Vector2.ZERO, .1)
		move_and_collide(velocity)
	if dead:
		$"detection"/CollisionShape2D.disabled = true
		
func _on_detection_body_entered(body):
	if body.has_method("player"):
		player_chase = true
		player = body

func _on_detection_body_exited(body):
	if body.has_method("player"):
		player_chase = false 
