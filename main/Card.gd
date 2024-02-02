@tool
## A Card in Cardophobia is a Godot Scene that can contain components that will
## display in-editor.  These components are called CardComponents.
class_name Card extends CardComponable

func _process(delta):
	pass

func _notification(what):
	if what == NOTIFICATION_EDITOR_POST_SAVE:
		_editor_update()
