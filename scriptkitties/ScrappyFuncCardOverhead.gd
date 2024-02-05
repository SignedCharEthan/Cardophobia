@tool

extends Card

@export_category("Cardophobia - Scrappy Overhead")

@export var main_name = "Scrappy" as String

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
	
func updateStrings() -> void:
	var implFuncCard = func (abilFuncCall: AbilityFuncCall,
		func_name: String, func_script: String):
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
		implFuncCard.call(funcCards[i], funcNames[i], funcScripts[i])
