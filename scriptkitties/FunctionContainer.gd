@tool

class_name FunctionContainer extends CardComponent

@export var mainName = "Kitty" as String:
	set(newName):
		mainName = newName
		for comp in getComponents():
			comp.mainName = mainName

@export var spacing = 0 as int:
	set(newSpacing):
		spacing = newSpacing
		updateSpacing()

func _editor_update() -> void:
	updateSpacing()
	super()

func updateSpacing() -> void:
	var comps = getComponents()
	var next = 0
	for comp in comps:
		comp = comp as FunctionCall
		
		comp.position.x = 0
		comp.position.y = next
		
		next += comp.getBounds().y + spacing
