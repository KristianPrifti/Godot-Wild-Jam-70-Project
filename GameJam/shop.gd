extends CharacterBody2D

func _ready():
	$upgrades.visible = false
	

func _process(delta):
	$AnimatedSprite2D.play("idle")





func upgrade_health():
	if GLOBAL.health_lv < 5:
		var cost = upgrade_cost(GLOBAL.health_lv)
		if GLOBAL.gold >= cost:
			GLOBAL.gold = GLOBAL.gold - cost
			GLOBAL.health_lv += 1
			GLOBAL.health += 2
			upgrade_shop_health()

func upgrade_damage():
	if GLOBAL.damage_lv < 5:
		var cost = upgrade_cost(GLOBAL.damage_lv)
		if GLOBAL.gold >= cost:
			GLOBAL.gold = GLOBAL.gold - cost
			GLOBAL.damage_lv += 1
			GLOBAL.damage += 1

func upgrade_speed():
	if GLOBAL.speed_lv < 5:
		var cost = upgrade_cost(GLOBAL.speed_lv)
		if GLOBAL.gold >= cost:
			GLOBAL.gold = GLOBAL.gold - cost
			GLOBAL.speed_lv += 1
			GLOBAL.speed += 30

func upgrade_shop_health():
	var lv = GLOBAL.health_lv
	pass
	#--------------------------NOT FInished-------------
	

func upgrade_cost(lv):
	if lv == 1:
		return 9
	elif lv == 2:
		return 13
	elif lv == 3:
		return 20
	elif lv == 4:
		return 30



# open the shop only when the player is close
func _on_shop_zone_body_entered(body):
	if body.name == "Player":
		$upgrades.visible = true

func _on_shop_zone_body_exited(body):
	if body.name == "Player":
		$upgrades.visible = false








func _on_buy_health_pressed():
	upgrade_health()

func _on_health_price_pressed():
	upgrade_health()


func _on_buy_damage_pressed():
	upgrade_damage()

func _on_damage_price_pressed():
	upgrade_damage()


func _on_buy_speed_pressed():
	upgrade_speed()

func _on_speed_price_pressed():
	upgrade_speed()
