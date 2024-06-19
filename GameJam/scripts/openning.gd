extends Node2D

var start_ended = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite2D/Dialogue").messages = [
		"Long long ago there was a little warrior ...",
		"he goes on an advanture to the Dungeon of Doom to find the mistical axe ...",
		"but what fate awaits him!",
		"OOOooooooooOOOoooOOO!!!!!!",
		"(Don't mind the mid story telling, we ran out of time and budget)"
	]
	do_start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_ended:
		$AnimatedSprite2D.play("loop")


func do_start():
	$AnimatedSprite2D.play("start")
	await $AnimatedSprite2D.animation_finished
	start_ended = true


func _on_button_pressed():
	GLOBAL.world.load_next_scene()
