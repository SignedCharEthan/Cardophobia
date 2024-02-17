@tool

class_name EnemyHalfOverhead extends CardComponent

@export var enemy_name = "Enemy" as String:
	set(new_name):
		enemy_name = new_name
		_local_update()

@export var stat_nums = [1, 1] as Array[int]
		
@export_multiline var ability_desc = "" as String:
	set(new_abil):
		ability_desc = new_abil
		_local_update()
		
@onready var statCol = $EnemyStatColumn as EnemyStatColumn

func _local_update() -> void:
	var nameBox = $Name as TextBox
	var abilDesc = $AbilDesc as TextBox
	var statCol = $EnemyStatColumn as EnemyStatColumn
	
	nameBox.text = enemy_name
	abilDesc.text = ability_desc
	abilDesc.position.x = 150
	abilDesc.position.y = 1050/2 - abilDesc.getContentBounds().y - 30

	statCol.stat_nums = stat_nums
