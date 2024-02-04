@tool

class_name EnemyOverhead extends Card

@export var enemyName = "Enemy" as String:
	set(newName):
		enemyName = newName
		($Name as TextBox).text = enemyName

@export var threat = "" as String:
	set(newThreat):
		threat = newThreat
		($Threat as TextBox).text = threat

@export var attack = "" as String:
	set(newAttack):
		attack = newAttack
		($Attack as TextBox).text = "ATK: " + attack
		
@export var hp = "" as String:
	set(newHP):
		hp = newHP
		($HP as TextBox).text = "HP: " + hp
