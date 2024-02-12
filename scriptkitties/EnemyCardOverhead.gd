@tool

class_name EnemyCardOverhead extends Card

@export_category("Cardophobia - Enemy Card Overhead")

@export_group("Top")

@export var t_name = "Enemy" as String
@export var t_atk = 1 as int
@export var t_hp = 1 as int
@export_multiline var t_abil = "" as String
@export var t_diff = "A" as String
@export_global_file("*png") var t_img = "" as String

@export_group("Bottom")

@export var b_name = "Harder Enemy" as String
@export var b_atk = 2 as int
@export var b_hp = 2 as int
@export_multiline var b_abil = "" as String
@export var b_diff = "B" as String
@export_global_file("*png") var b_img = "" as String

func _local_update() -> void:
	var top = $Top as EnemyHalfOverhead
	var diffTop = $DiffTop as TextBox
	
	top.enemy_name = t_name
	top.atk_stat = t_atk
	top.hp_stat = t_hp
	top.ability_desc = t_abil
	diffTop.text = t_diff
	
	var bot = $Bot as EnemyHalfOverhead
	var diffBot = $DiffBot as TextBox
	
	bot.enemy_name = b_name
	bot.atk_stat = b_atk
	bot.hp_stat = b_hp
	bot.ability_desc = b_abil
	diffBot.text = b_diff
	
	var topImg = $TopImg as Sprite2D
	if (t_img):
		topImg.visible = true
		topImg.texture = load(t_img)
	else:
		topImg.visible = false
		
	var botImg = $BotImg as Sprite2D
	if (b_img):
		botImg.visible = true
		botImg.texture = load(b_img)
	else:
		botImg.visible = false

