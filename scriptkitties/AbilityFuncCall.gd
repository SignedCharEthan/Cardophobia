@tool

class_name AbilityFuncCall extends CardComponent

@onready var kittyName = $KittyName as TextBox
@onready var functionName = $FunctionName as TextBox
@onready var functionScript = $FunctionScript as TextBox

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
		

func _local_update() -> void:
	kittyName = $KittyName as TextBox
	functionName = $FunctionName as TextBox
	functionScript = $FunctionScript as TextBox
	
	kittyName.text = kitty_name
	kittyName.position = Vector2.ZERO
	functionName.text = "." + function_name + "()"
	functionName.position = Vector2(kittyName.getContentBounds().x, 0)
	functionScript.text = function_script
	functionScript.position = Vector2(0, kittyName.getContentBounds().y)
	
	super()

func getContentBounds() -> Vector2:
	if (function_name == ""):
		return Vector2.ZERO
	
	return Vector2(
		max(
			kittyName.getContentBounds().x + functionName.getContentBounds().x,
			functionScript.getContentBounds().x
		),
		kittyName.getContentBounds().y + functionScript.getContentBounds().y
	)
