extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.restart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play("loop")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
