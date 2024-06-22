extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.restart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$wiz.play("loop")
	$warrior.play("attack")
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
