@tool

class_name DefaultFuncCard extends Card

@export_category("ScriptKitties - Func Card Overhead")

@export var kitty_name = "Kitty" as String

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

@onready var func1 = $FuncContainer/func1 as AbilityFuncCall
@onready var func2 = $FuncContainer/func2 as AbilityFuncCall
@onready var func3 = $FuncContainer/func3 as AbilityFuncCall
@onready var func4 = $FuncContainer/func4 as AbilityFuncCall

func _local_update() -> void:
	updateAbils()

func updateAbils() -> void:
	var pre_all = [pre_1, pre_2, pre_3, pre_4]
	var name_all = [name_1, name_2, name_3, name_4]
	var scr_all = [scr_1, scr_2, scr_3, scr_4]
	
	var abils = [func1, func2, func3, func4]
	
	for i in range(4):
		var abil = abils[i] as AbilityFuncCall
		abil.kitty_name = kitty_name
		abil.prerequisite = pre_all[i]
		abil.function_name = name_all[i]
		abil.function_script = scr_all[i]
		
		abil.visible = (name_all[i] != "")
