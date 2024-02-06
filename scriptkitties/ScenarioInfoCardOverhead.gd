@tool

class_name ScenarioInfoCardOverhead extends Card

@export var scenario_name = "Scenario" as String:
	set(new_scen):
		scenario_name = new_scen
		_local_update()
		
@export var scenario_desc = "Description." as String:
	set(new_desc):
		scenario_desc = new_desc
		_local_update()


func _local_update() -> void:
	var scenario = $Scenario as TextBox
	var desc = $Desc as TextBox
	
	scenario.text = scenario_name
	desc.text = scenario_desc
