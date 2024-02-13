@tool

class_name AbilityFuncCall extends CardComponent

@export_category("ScriptKitties - Function Call")

@onready var kittyName = $KittyName as TextBox
@onready var functionName = $FunctionName as TextBox
@onready var functionScript = $FunctionScript as TextBox
@onready var prereqBox = $Prereq as TextBox

@export var kitty_name = "Kitty" as String
@export var function_name = "func" as String
@export var function_script = "Waiting for something to happen?" as String
@export var prerequisite = "" as String

@export_group("Text")
@export var title_size = 36 as int
@export var script_size = 30 as int
@export var bound_size = Vector2(500, 500) as Vector2


func _local_update() -> void:
	
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
	
	updateFonts()
	
	super()
	
func updateFonts() -> void:
	prereqBox.font_size = title_size
	kittyName.font_size = title_size
	functionName.font_size = title_size
	functionScript.font_size = script_size

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
