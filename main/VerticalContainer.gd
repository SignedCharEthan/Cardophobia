@tool

class_name VerticalContainer extends CardComponent

@export_category("Cardophobia - Vertical Container")

@export var spacing = 50 as int:
	set(new_spacing):
		spacing = new_spacing
		_local_update()

func _local_update() -> void:
	var comps = getComponents()
	var next = 0
	for comp in comps:
		comp = comp as CardComponent
		
		comp.position.x = 0
		comp.position.y = next
		
		next += comp.getContentBounds().y + spacing
