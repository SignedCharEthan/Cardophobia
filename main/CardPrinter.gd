extends Node2D

@onready var subView = $SubViewport as SubViewport
@onready var cardParent = subView.get_child(0)
@onready var cards = cardParent.get_children()


var Node_CutLines = preload("res://main/CutLines.tscn")

func _ready() -> void:
	_spreadCards()
	
	
func _spreadCards():
	for x in range(3):
		for y in range(3):
			var card = cards[y*3 + x]
			card = card as Card
			card.position.x += 750*x
			card.position.y += 1050*y
	
	for x in range(4):
		for y in range(4):
			var cutLine = Node_CutLines.instantiate() as Node2D
			subView.add_child(cutLine)
			cutLine.position.x += x * 750
			cutLine.position.y += y * 1050

func _unhandled_key_input(event):
	if Input.is_action_just_pressed("save_image"):
		#capture = camera.get_viewport().get_texture().get_image()
		var capture = subView.get_texture().get_image()
		var time = Time.get_datetime_string_from_system().replace(":","-")
		var path = "C:\\users\\emanr\\Videos\\Cardophobia\\"
		var filename = path + "Screenshot-{0}.png".format({"0":time})
		capture.save_png(filename)
