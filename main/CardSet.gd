@tool

class_name CardSet extends CardComponable

func getCards() -> Array[Card]:
	var output = [] as Array[Card]
	for child in get_children():
		if child is Card:
			output.append(child)
	return output

func _local_update() -> void:
	var cards = getCards()
	var card_amt = cards.size()
	for i in range(card_amt):
		cards[i].position = Vector2(
			(i%3) * 750,
			(i/3) * 1050
		)
		
