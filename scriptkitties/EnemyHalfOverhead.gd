@tool

class_name EnemyHalfOverhead extends CardComponent

@export var enemy_name = "Enemy" as String:
	set(new_name):
		enemy_name = new_name
		_local_update()

@export var atk_stat = 1 as int:
	set(new_atk):
		atk_stat = new_atk
		_local_update()

@export var hp_stat = 1 as int:
	set(new_hp):
		hp_stat = new_hp
		_local_update()
		
@export_multiline var ability_desc = "" as String:
	set(new_abil):
		ability_desc = new_abil
		_local_update()

func _local_update() -> void:
	var nameBox = $Name as TextBox
	var atkStat = $AtkStat as TextBox
	var hpStat = $HpStat as TextBox
	var abilDesc = $AbilDesc as TextBox
	
	nameBox.text = enemy_name
	atkStat.text = str(atk_stat)
	hpStat.text = str(hp_stat)
	abilDesc.text = ability_desc
	abilDesc.position.x = 25
	abilDesc.position.y = 1050/2 - abilDesc.getContentBounds().y - 120
