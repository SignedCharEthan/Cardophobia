@tool

class_name FunctionCall extends CardComponent

@export var mainName = "Example" as String:
	set(newStr):
		mainName = newStr
		groupFunctionNames()
@export var functionName = "name" as String:
	set(newStr):
		functionName = newStr
		groupFunctionNames()
@export_multiline var functionScript = "waiting for something to happen?" as String:
	set(newStr):
		functionScript = newStr
		($FunctionScript as TextBox).text = scriptifyText(functionScript)

func groupFunctionNames() -> void:
	var fn = $FunctionName as TextBox
	var mn = $MainName as TextBox
	var nameRect := mn.getFont().get_string_size(mainName, 0, -1, mn.fontSize)
	
	mn.text = mainName
	fn.text = "." + functionName + "()"
	fn.position.x = nameRect.x
	fn.position.y = $MainName.position.y

func scriptifyText(text: String) -> String:
	text.replace("->", "➝")
	return text

func getBounds() -> Vector2:
	var bounds = Vector2.ZERO
	var comps = getComponents()
	for comp in comps:
		comp = comp as TextBox
		var compBounds = comp.getBounds()
		bounds.x = max(
			bounds.x,
			compBounds.x
		)
		bounds.y += compBounds.y
	bounds.y -= comps[0].getBounds().y  # Remove title y because it doubles down
	return bounds
