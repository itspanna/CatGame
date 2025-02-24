extends CanvasLayer

var pont_collected = 0 
@onready var goodtem = $good_item

func _ready():
	$Counter.text = "Pontok: " + str(pont_collected)

func _process(delta):
	pass
	
func _on_good_item_body_entered(body:) -> void:
	print("Ütközött: ", body.name)  # Kiírja, melyik objektumot érzékelte
	pont_collected += 1  
	$Counter.text = "Pontok: " + str(pont_collected)
	body.queue_free()
