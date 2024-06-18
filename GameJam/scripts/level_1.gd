extends Node2D

@onready var g1 = get_node("enemies/Goblin1")
@onready var g2 = get_node("enemies/Goblin2")
@onready var g3 = get_node("enemies/Goblin3")


# Called when the node enters the scene tree for the first time.
func _ready():
	g1.move_to_from(310, 310, 740, 310)
	g2.move_to_from(165, 170, 165, 450)
	#g2.get_node("AnimatedSprite2D").flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if g1.direction:
		#g1.get_node("AnimatedSprite2D").flip_h = false
		g1.get_node("AnimatedSprite2D").play("run_right")
	else:
		#g1.get_node("AnimatedSprite2D").flip_h = true
		g1.get_node("AnimatedSprite2D").play("run_left")
	
	g2.get_node("AnimatedSprite2D").play("run_right")
	g3.get_node("AnimatedSprite2D").play("idle_right")
