@tool

class_name EnemyCardOverhead extends Card

@export_category("Cardophobia - Enemy Card Overhead")

@export_group("Top")

@export var t_name = "Enemy" as String
@export var t_atk = 1 as int
@export var t_hp = 1 as int
@export_multiline var t_abil = "" as String
@export var t_diff = "A" as String

@export_group("Bottom")

@export var b_name = "Harder Enemy" as String
@export var b_atk = 2 as int
@export var b_hp = 2 as int
@export_multiline var b_abil = "" as String
@export var b_diff = "B" as String

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

