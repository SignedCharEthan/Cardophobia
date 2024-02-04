@tool

class_name TextBox extends CardComponent

@onready var textBox = $RichTextLabel as RichTextLabel

@export_category("Text")

@export_multiline var text = "Example Text" as String:
	set(newText):
		text = newText
		textBox.text = text
		
@export var theme: Theme:
	set(newTheme):
		theme = newTheme as Theme
		font_size = theme.default_font_size
		_editor_update()

@export var bound_size := Vector2(300, 300):
	set(new_bs):
		bound_size = new_bs
		_editor_update()

@export_category("Local Override")

@export var font_size = 24 as int:
	set(new_fs):
		font_size = new_fs
		_editor_update()

func _editor_update() -> void:
	textBox.size = bound_size
	textBox.text = text
	
	textBox.theme = theme
	
	textBox.set("theme_override_font_sizes/normal_font_size", font_size)

	super()

func getFont() -> Font:
	if theme != null:
		return theme.default_font
	else: return null

func getBounds() -> Vector2:
	return getFont().get_multiline_string_size(text, 0, bound_size.x, font_size)
