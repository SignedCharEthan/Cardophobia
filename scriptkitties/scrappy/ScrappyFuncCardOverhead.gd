@tool

extends Card

@export_category("Cardophobia - Scrappy Overhead")

@export var main_name = "Scrappy" as String

@export var card_size = Vector2(750, 1050) as Vector2

@export_group("Up Functions")

@export var u_name_1 = "func1" as String
@export_multiline var u_script_1 = "Waiting for something to happen?" as String
@export var u_name_2 = "" as String
@export_multiline var u_script_2 = "" as String
@export var u_name_3 = "" as String
@export_multiline var u_script_3 = "" as String

@export_group("Down Functions")

@export var d_name_1 = "func1" as String
@export_multiline var d_script_1 = "Waiting for something to happen?" as String
@export var d_name_2 = "" as String
@export_multiline var d_script_2 = "" as String
@export var d_name_3 = "" as String
@export_multiline var d_script_3 = "" as String

func _local_update() -> void:
	updateStrings()
	
	var upFuncs = $UpFuncs as VerticalContainer
	var downFuncs = $DownFuncs as VerticalContainer
	
	var upY = 0 + upFuncs.getContentBounds().y
	var downY = card_size.y - downFuncs.getContentBounds().y
	var midY = (upY + downY)/2
	
	var divider = $Divider as RectangleComponent
	var div_h = divider.height
	var div_w = divider.width

	divider.position.y = midY - div_h/2
	divider.position.x = card_size.x/2 - div_w/2
	
func updateStrings() -> void:
	var implFuncCard = func (abilFuncCall: AbilityFuncCall, main_name: String,
		func_name: String, func_script: String):
		if func_name == "":
			abilFuncCall.visible = false
		else:
			abilFuncCall.visible = true
		abilFuncCall.kitty_name = main_name
		abilFuncCall.function_name = func_name
		abilFuncCall.function_script = func_script
	
	var upFuncs = $UpFuncs as VerticalContainer
	var downFuncs = $DownFuncs as VerticalContainer
	var funcCards = upFuncs.get_children()
	funcCards.append_array(downFuncs.get_children())
	
	var funcNames = [u_name_1, u_name_2, u_name_3, d_name_1, d_name_2, d_name_3]
	var funcScripts = [u_script_1, u_script_2, u_script_3,
		d_script_1, d_script_2, d_script_3]
	
	for i in range(6):
		implFuncCard.call(funcCards[i], main_name,
			funcNames[i], funcScripts[i])
