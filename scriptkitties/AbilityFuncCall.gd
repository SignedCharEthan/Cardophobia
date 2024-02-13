@tool

class_name AbilityFuncCall extends CardComponent

@export_category("ScriptKitties - Function Call")

@export var kitty_name = "Kitty" as String:
	set(new_kitty_name):
		kitty_name = new_kitty_name
		_local_update()
@export var function_name = "func" as String:
	set(new_function_name):
		function_name = new_function_name
		_local_update()
@export var function_script = "Waiting for something to happen?" as String:
	set(new_function_script):
		function_script = new_function_script
		_local_update()
@export var prerequisite = "" as String:
	set(new_prereq):
		prerequisite = new_prereq
		_local_update()

@export_group("Text")
@export var bound_size = Vector2(500, 500) as Vector2


func _local_update() -> void:
	var kittyName = $KittyName as TextBox
	var functionName = $FunctionName as TextBox
	var functionScript = $FunctionScript as TextBox
	var prereqBox = $Prereq as TextBox
	
	if (prerequisite == "" or prerequisite == null):
		prereqBox.text = ""
		prereqBox.position = Vector2.ZERO
	else:
		prereqBox.text = prerequisite + " :: "
		prereqBox.position = Vector2.ZERO
	
	kittyName.text = kitty_name
	kittyName.position = Vector2(
		prereqBox.position.x + prereqBox.getContentBounds().x, 0)
	functionName.text = "." + function_name + "()"
	functionName.position = Vector2(
		kittyName.position.x + kittyName.getContentBounds().x, 0)
	functionScript.text = function_script
	functionScript.position = Vector2(0, kittyName.getContentBounds().y)
	functionScript.bound_size = bound_size
	
	super()

func getContentBounds() -> Vector2:
	var kittyName = $KittyName as TextBox
	var functionName = $FunctionName as TextBox
	var functionScript = $FunctionScript as TextBox
	var prereqBox = $Prereq
	
	if (function_name == ""):
		return Vector2.ZERO
	
	return Vector2(
		max(
			kittyName.getContentBounds().x + functionName.getContentBounds().x,
			functionScript.getContentBounds().x
		),
		kittyName.getContentBounds().y + functionScript.getContentBounds().y
	)
