@tool

class_name VariableOverhead extends CardComponent

var Node_TextBox = preload("res://main/TextBox.tscn")

@export var variables = [] as Array[String]

func _local_update() -> void:
	for child in get_children():
		child.queue_free()
	spreadTexts()
	
func spreadTexts() -> void:
	pass
