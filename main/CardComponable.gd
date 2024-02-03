class_name CardComponable extends Node2D

## Updates this Card/Component and all children that are also
## Cards or Components, specifically geared towards in-editor updates.
func _editor_update() -> void:
	for comp in getComponents():
		comp._editor_update()

## Get all CardComponents of this Card/Component.
func getComponents() -> Array[CardComponent]:
	var comps = [] as Array[CardComponent]
	for child in get_children():
		if child is CardComponent:
			comps.append(child)
	return comps

## Get all Cells of this Card/Component
func getCells() -> Array[Cell]:
	var cells = [] as Array[Cell]
	for child in get_children():
		if child is Cell:
			cells.append(child)
	return cells
