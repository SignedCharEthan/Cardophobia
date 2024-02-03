@tool

## An Overhead takes Cells and recontextualizes them,
## creating CardComponents as needed.
class_name ScrappyOverhead extends CardComponent

@onready var Node_FunctionCall = preload("res://scriptkitties/FunctionCall.tscn")

func _editor_update() -> void:
	for child in $FunctionContainer.get_children():
		child.queue_free()
	
	for cell in getCells():
		if cell is FunctionCell:
			implementFunctionCell(cell)
	super()

func implementFunctionCell(cell: FunctionCell) -> void:
	var fc = Node_FunctionCall.instantiate() as FunctionCall
	fc.mainName = $FunctionContainer.mainName
	fc.functionName = cell.functionName
	fc.functionScript = cell.functionScript
	$FunctionContainer.add_child(fc)
