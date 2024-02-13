@tool

class_name DefaultFuncCard extends Card

@export_category("ScriptKitties - Func Card Overhead")

@export var kitty_name = "Kitty" as String
@export var kitty_nickname = "Kitty" as String

@export_group("Function Abilities")

@export var pre_1 = "" as String
@export var name_1 = "" as String
@export_multiline var scr_1 = "" as String

@export var pre_2 = "" as String
@export var name_2 = "" as String
@export_multiline var scr_2 = "" as String

@export var pre_3 = "" as String
@export var name_3 = "" as String
@export_multiline var scr_3 = "" as String

@export var pre_4 = "" as String
@export var name_4 = "" as String
@export_multiline var scr_4 = "" as String

@export_group("Variable Card")

@export_enum("BOOL", "INT") var variable_type = "BOOL" as String

@onready var func1 = $FuncContainer/func1 as AbilityFuncCall
@onready var func2 = $FuncContainer/func2 as AbilityFuncCall
@onready var func3 = $FuncContainer/func3 as AbilityFuncCall
@onready var func4 = $FuncContainer/func4 as AbilityFuncCall

@onready var varOver = $VariableOverhead as VariableOverhead

@onready var kittyName = $TopBar/KittyName as TextBox
@onready var varType = $TopBar/VarType as TextBox

func _local_update() -> void:
	updateAbils()
	updateVars()
	updateTopBar()


func updateAbils() -> void:
	var pre_all = [pre_1, pre_2, pre_3, pre_4]
	var name_all = [name_1, name_2, name_3, name_4]
	var scr_all = [scr_1, scr_2, scr_3, scr_4]
	
	var abils = [func1, func2, func3, func4]
	
	for i in range(4):
		var abil = abils[i] as AbilityFuncCall
		abil.kitty_name = kitty_nickname
		abil.prerequisite = pre_all[i]
		abil.function_name = name_all[i]
		abil.function_script = scr_all[i]
		
		abil.visible = (name_all[i] != "")

func updateVars() -> void:
	if variable_type == "BOOL":
		varOver.variables = ["False", "True"]
	elif variable_type == "INT":
		varOver.variables = ["0", "1", "2", "3", "4", "5", "6", "7"]

func updateTopBar() -> void:
	kittyName.text = kitty_name
	varType.text = variable_type
