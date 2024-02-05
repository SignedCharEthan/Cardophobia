@tool

class_name CardComponable extends Node2D

func _ready():
	_editor_update()

func _notification(what):
	if what == NOTIFICATION_EDITOR_POST_SAVE:
		_editor_update()

## Updates this Card/Component and all children that are also
## Cards or Components, specifically geared towards in-editor updates.
func _editor_update() -> void:
	_local_update()
	for comp in getComponents():
		comp._editor_update()

## Updates only local stuff, does not call child updates.
func _local_update() -> void:
	pass


## Get all CardComponents of this Card/Component.
func getComponents() -> Array[CardComponent]:
	var comps = [] as Array[CardComponent]
	for child in get_children():
		if child is CardComponent:
			comps.append(child)
	return comps
