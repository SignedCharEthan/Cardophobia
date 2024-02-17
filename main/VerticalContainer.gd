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

func getSize() -> int:
	return get_child_count()

func getContentBounds() -> Vector2:
	var output = Vector2.ZERO
	for child in get_children():
		child = child as CardComponent
		output.x = max(output.x, child.getContentBounds().x)
		output.y += child.getContentBounds().y
		if child.getContentBounds() != Vector2.ZERO:
			output.y += spacing
	output.y -= spacing
	return output
