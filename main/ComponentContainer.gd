@tool

class_name ComponentContainer extends CardComponent

@export_category("Cardophobia - Component Container")

@export var spacing = 0 as int:
	set(new_spacing):
		spacing = new_spacing
		_local_update()
		_post_update()

func _post_update() -> void:
	var curY = 0
	for comp in getComponents():
		comp.position.y = curY
		curY += comp.getContentBounds().y + spacing
		
