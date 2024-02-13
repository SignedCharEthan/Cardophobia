@tool

class_name CardComponent extends CardComponable

## Retrieve the bounds of this shape.
func getBounds() -> Vector2:
	return Vector2.ZERO

## Retrieve this component's content bounds.  This is often smaller
## than the actual bounds (getBounds()) because the entire bounds
## are sometimes not used.
func getContentBounds() -> Vector2:
	# If this is not overriden, just default to getBounds()
	return getBounds()
