@tool

## A TextBox contains a box of text (Godot: RichTextLabel)
class_name TextBox extends CardComponent

@onready var textBox = $RichTextLabel as RichTextLabel

@export_category("Cardophobia - TextBox")

@export_group("Text")

@export_multiline var text = "Example Text" as String:
	set(new_text):
		text = new_text
		_local_update()

@export var theme: Theme:
	set(new_theme):
		theme = new_theme as Theme
		font_size = theme.default_font_size
		_local_update()

@export var bound_size := Vector2(300, 300):
	set(new_bs):
		bound_size = new_bs
		_local_update()

@export_group("Local Override")

@export var font_size = 24 as int:
	set(new_fs):
		font_size = new_fs
		_local_update()

@export var tab_size = 4 as int:
	set(new_tab_size):
		tab_size = new_tab_size
		_local_update()

@export_enum("Left", "Center", "Right") var alignment = 0 as int:
	set(new_alignment):
		alignment = new_alignment
		_local_update()


func _local_update() -> void:
	textBox = $RichTextLabel as RichTextLabel
	
	textBox.size = bound_size
	textBox.tab_size = tab_size
	
	var final_text = text
	final_text = prettifyText(final_text)
	final_text = applyBBCode(final_text)
	textBox.parse_bbcode(final_text)
	
	textBox.theme = theme
	
	textBox.set("theme_override_font_sizes/normal_font_size", font_size)

func prettifyText(text: String) -> String:
	text = text.replace("->", "→")
	text = text.replace("<=", "≤")
	text = text.replace(">=", "≥")
	
	return text

func applyBBCode(text: String) -> String:
	
	if alignment == 0:
		text = "[left]" + str(text) + "[/left]"
	elif alignment == 1:
		text = "[center]" + str(text) + "[/center]"
	elif alignment == 2:
		text = "[right]" + str(text) + "[/right]"
	
	return text

## Retrieve the text box's theme's font.
func getFont() -> Font:
	if theme != null:
		return theme.default_font
	else: return null

## Retrieve the multiline string size of the text in the text box.
## The bounds are based on the text, theme, and font size override.
func getContentBounds() -> Vector2:
	return getFont().get_multiline_string_size(
		str(text), 0, bound_size.x, font_size)
