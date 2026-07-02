extends Control

var player = {
	"gold": 50,
	"castle_hp": 100,
	"soldiers": 0,
	"archers": 0,
	"catapults": 0,
	"mines": 0
}

var enemy = {
	"gold": 50,
	"castle_hp": 100,
	"soldiers": 0,
	"archers": 0,
	"catapults": 0,
	"mines": 0
}


func _ready():
	update_ui()


func update_ui():
	$VBoxContainer/GoldLabel.text = "Gold: " + str(player["gold"])
	$VBoxContainer/CastleLabel.text = "Castle HP: " + str(player["castle_hp"])

	$VBoxContainer/SoldierLabel.text = "Soldiers: " + str(player["soldiers"])
	$VBoxContainer/ArcherLabel.text = "Archers: " + str(player["archers"])
	$VBoxContainer/CatapultLabel.text = "Catapults: " + str(player["catapults"])
	$VBoxContainer/MineLabel.text = "Mines: " + str(player["mines"])
	$VBoxContainer/EnemyGoldLabel.text = "Gold: " + str(enemy["gold"])
	$VBoxContainer/EnemyCastleLabel.text = "Castle HP: " + str(enemy["castle_hp"])
	$VBoxContainer/EnemySoldierLabel.text = "Soldiers: " + str(enemy["soldiers"])
	$VBoxContainer/EnemyArcherLabel.text = "Archers: " + str(enemy["archers"])
	$VBoxContainer/EnemyCatapultLabel.text = "Catapults: " + str(enemy["catapults"])
	$VBoxContainer/EnemyMineLabel.text = "Mines: " + str(enemy["mines"])

func recruit_soldier(target):
	if target["gold"] >= 10:
		target["gold"] -= 10
		target["soldiers"] += 1

func recruit_archer(target):
	if target["gold"] >= 15:
		target["gold"] -= 15
		target["archers"] += 1

func recruit_catapult(target):
	if target["gold"] >= 30:
		target["gold"] -= 30
		target["catapults"] += 1

func build_mine(target):
	if target["gold"] >= 50:
		target["gold"] -= 50
		target["mines"] += 1


func _on_recruit_soldier_button_pressed() -> void:
	recruit_soldier(player)
	update_ui()


func _on_recruit_archer_button_pressed() -> void:
	recruit_archer(player)
	update_ui()


func _on_recruit_catapult_button_pressed() -> void:
	recruit_catapult(player)
	update_ui()

func _on_build_mine_button_pressed() -> void:
	build_mine(player)
	update_ui()


func _on_end_turn_button_pressed() -> void:
	player["gold"] += 20
	player["gold"] += player["mines"] * 10

	update_ui()
