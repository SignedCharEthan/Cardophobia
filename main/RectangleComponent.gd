@tool

class_name RectangleComponent extends CardComponent

@export var width = 1 as int:
	set(new_width):
		width = new_width
		_local_update()
		
@export var height = 1 as int:
	set(new_height):
		height = new_height
		_local_update()
		
@export var color = Color(255) as Color:
	set(new_color):
		color = new_color
		_local_update()

func _local_update() -> void:
	var rect = $ColorRect as ColorRect
	rect.size = Vector2(float(width), float(height))
	if color:
		rect.color = color
