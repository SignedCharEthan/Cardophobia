@tool

class_name EnemyStatColumn extends CardComponent

@onready var holders = $Holders as CardComponent
@onready var icons = $Icons as CardComponent
@onready var stats = $Stats as CardComponent

@export var stat_nums = [1, 1] as Array[int]

func _local_update():
	_applyStats()
	_applySpacing()
	

func _applyStats():
	for i in range(holders.get_child_count()):
		setStat(i, stat_nums[i])

func _applySpacing():
	var cur = 0
	for i in range(holders.get_child_count()):
		var holder = holders.get_child(i) as Node2D
		var icon = icons.get_child(i) as Node2D
		var stat = stats.get_child(i) as Node2D
		
		if holder.visible:
			holder.position = Vector2(0, 2000 * cur)
			icon.position = Vector2(0, 2000 * cur)
			stat.position = Vector2(0, 2000 * cur)
			cur += 1


func setStat(n: int, x: int):
	stat_nums[n] = x
	stats.get_child(n).text = str(x)
	setShow(n, (x != -1))

func setShow(n: int, b: bool):
	holders.get_child(n).visible = b
	icons.get_child(n).visible = b
	stats.get_child(n).visible = b
