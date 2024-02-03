@tool

class_name TextBox extends CardComponent

@export_multiline var text = "Example Text" as String:
	set(newText):
		text = newText
		$RichTextLabel.text = newText
		
@export var theme: Theme:
	set(newTheme):
		theme = newTheme as Theme
		fontSize = theme.default_font_size
		$RichTextLabel.theme = theme
		
		
@export var fontSize = 24 as int:
	set(newFS):
		fontSize = newFS
		if $RichTextLabel.theme != null:
			$RichTextLabel.theme.default_font_size = fontSize

@export var boundSize = Vector2(300, 300):
	set(newBS):
		boundSize = newBS
		$RichTextLabel.size = newBS
		
func getFont() -> Font:
	if theme != null:
		return (theme as Theme).default_font
	else: return null

func getBounds() -> Vector2:
	return getFont().get_multiline_string_size(text, 0, boundSize.x, fontSize)
