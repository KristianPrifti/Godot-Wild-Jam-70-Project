extends Node2D

var start_ended = false

var scene_1 = [
		"Long long ago there was a little warrior ...",
		"he goes on an advanture to the Dungeon of Doom to find the mistical axe ...",
		"but what fate awaits him!",
		"OOOooooooooOOOoooOOO!!!!!!",
		"(Don't mind the mid story telling, we ran out of time and budget)"
	]

var scene_2 = [
	"Goblins are not the only monster hiding in the castle ...",
	"Who knows what our hero will face next!"
]

var scene_3 = [
	"temp"
]

var scene_4 = [
	"temp"
]
# Called when the node enters the scene tree for the first time.
func _ready():
	var scene
	if GLOBAL.cut_scene_counter == 1:
		scene = scene_1
	elif GLOBAL.cut_scene_counter == 2:
		scene = scene_2
	elif GLOBAL.cut_scene_counter == 3:
		scene = scene_3
	elif GLOBAL.cut_scene_counter == 4:
		scene = scene_4
	
	GLOBAL.cut_scene_counter += 1
	
	get_node("Sprite2D/Dialogue").messages = scene
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
