extends Node2D

var start_ended = false

var scene_1 = [
		"Long long ago there was a little warrior ...",
		"he goes on an advanture to the Dungeon of Doom to find the mistical axe ...",
		"but what fate awaits him!",
		"OOOooooooooOOOoooOOO!!!!!!",
	]

var scene_2 = [
	"Goblins are not the only monster hiding in the dungeon ...",
	"Who knows what our hero will face next!"
]

var scene_3 = [
	"Until now the warrior only faced monster ...",
	"but not everyone in the dungeon wants to deal harm ...",
	"some just want to get some value out of their marketing degree. ...",
	"Maybe the hero will benefit from some upgrades."
]

var scene_4 = [
	"The Dungeon of Doom is a mysterious place ...",
	"You never know where a door could lead to ...",
	"Our warrior should be carefull but sometimes you cannot avoid the risk!"
]

var scene_5 = [
	"The Dungeon of Doom is full of creatures ...",
	"some of them just move from room to room and deal no harm ...",
	"... that doesn't mean they don't carry some sweet gold tho."
]

var scene_6 = [
	"The warrior learns that his actions have consequances ...",
	"the ghosts of the innocent rats and bats that he killed for his own benefit have come for revange ...",
	"Will our hero be able to get out of this mess or did he defeat a few to many bystandarts in the previous flor!"
]

var scene_7 = [
	"Emmmm...",
	"We knew the dungeon was difficult to get around but this is ridiculous ...",
	"... A whole maze, will the hero be able to find a way out ?!"
]

var scene_8 = [
	"Pesonally I had my doubts but it looks like the warrior made it through the maze ...",
	"Just one more challange for him to face ...",
	"Defeating the Slime King. ...",
	"Then the mistical axe will be held by a true hero!"
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
	elif GLOBAL.cut_scene_counter == 5:
		scene = scene_5
	elif GLOBAL.cut_scene_counter == 6:
		scene = scene_6
	elif GLOBAL.cut_scene_counter == 7:
		scene = scene_7
	elif GLOBAL.cut_scene_counter == 8:
		scene = scene_8
	
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
