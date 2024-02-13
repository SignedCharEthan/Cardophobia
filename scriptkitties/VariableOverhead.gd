@tool

class_name VariableOverhead extends CardComponent

@export var variables = [] as Array[String]
@export var theme: Theme = null

@export var size = Vector2(100,100) as Vector2

func _local_update() -> void:
	changeVisibility()
	resetTexts()
	spreadTexts()
	
func resetTexts() -> void:
	for comp in getComponents():
		comp.text = ""

func spreadTexts() -> void:

	var power = findPower(variables.size())
	var total_dist = size.x * 2 + size.y * 2 as float
	
	for i in range(variables.size()):
		var tb = get_child(i) as TextBoxCentered
		var dist_perc = float(i)/float(power)
		var wrap_dist = dist_perc * total_dist # Pixels to be wrapped
		
		tb.position = findWrapDist(size.x, size.y, wrap_dist)
		tb.rotation_degrees = (
			findWrapRotation(size.x, size.y, wrap_dist)) * 90
		tb.text = variables[i]


func findWrapDist(width, height, wrap_dist) -> Vector2:
	var x = 0
	var y = -height/2
	var partitions = [width/2, height, width, height, width/2]
	# p1 - top right
	var p = partitions[0]
	x += min(wrap_dist, p)
	wrap_dist -= min(wrap_dist, p)
	# p2 - right side
	p = partitions[1]
	y += min(wrap_dist, p)
	wrap_dist -= min(wrap_dist, p)
	# p3 - bottom side
	p = partitions[2]
	x -= min(wrap_dist, p)
	wrap_dist -= min(wrap_dist, p)
	# p4 - left side
	p = partitions[3]
	y -= min(wrap_dist, p)
	wrap_dist -= min(wrap_dist, p)
	# p5 - top left
	p = partitions[4]
	x += min(wrap_dist, p)
	wrap_dist -= min(wrap_dist, p)
	
	return Vector2(x, y)

func findWrapRotation(width, height, wrap_dist) -> int:
	var partitions = [
		width/2,
		width/2 + height,
		3*width/2 + height,
		3*width/2 + 2*height,
		2*width + 2*height
	]
	
	for i in range(partitions.size()):
		if wrap_dist < partitions[i]:
			return i
	return partitions.size()

func changeVisibility() -> void:
	for i in range(get_child_count()):
		get_child(i).visible = (i < variables.size())

## Find the closest power of 2, including the given number.
func findPower(x: int) -> int:
	var output = 1
	while output < x:
		output *= 2
	return output
	
