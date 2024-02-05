@tool

## A centered version of a TextBox.
class_name TextBoxCentered extends CardComponent

@export_category("Cardophobia - TextBox")

@export_group("Text")

@export var text = "False" as String:
	set(new_text):
		text = new_text
		_local_update()

func _local_update() -> void:
	var textBox = $Label as Label
	
	textBox.text = text


## Retrieve the multiline string size of the text in the text box.
## The bounds are based on the text, theme, and font size override.
func getContentBounds() -> Vector2:
	return Vector2(100,100)
