extends CharacterBody2D

func _ready():
	$upgrades.visible = false
	

func _process(delta):
	$AnimatedSprite2D.play("idle")
	upgrade_shop_component("health")
	upgrade_shop_component("damage")
	upgrade_shop_component("speed")


func upgrade_health():
	if GLOBAL.health_lv < 5:
		var cost = upgrade_cost(GLOBAL.health_lv)
		if GLOBAL.gold >= cost:
			GLOBAL.gold = GLOBAL.gold - cost
			GLOBAL.health_lv += 1
			GLOBAL.health += 2

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
			GLOBAL.speed += 50


func upgrade_shop_component(component):
	var lv
	var lv_label
	var price_label
	if component == "health":
		lv = GLOBAL.health_lv
		lv_label = get_node("upgrades/Helath/lvl")
		price_label = get_node("upgrades/Helath/health_price/Label")
	elif component == "damage":
		lv = GLOBAL.damage_lv
		lv_label = get_node("upgrades/Damage/lvl")
		price_label = get_node("upgrades/Damage/damage_price/Label")
	elif component == "speed":
		lv = GLOBAL.speed_lv
		lv_label = get_node("upgrades/Speed/lvl")
		price_label = get_node("upgrades/Speed/speed_price/Label")
	
	lv_label.text = "Lvl. " + str(lv)
	if lv == 1 || lv == 2:
		price_label.text = str(upgrade_cost(lv)) + " Gold"
	elif lv == 3 || lv == 4:
		price_label.text = str(upgrade_cost(lv)) + "  Gold"
	else:
		price_label.text = "Max Lvl"

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
