extends Area2D

var speed = 500  # Item esési sebessége

func _ready():
	add_to_group("good_item")

func _physics_process(delta):
	position.y += speed * delta  # Item esik lefelé

	# Ha kimegy a képernyőről, törlődik
	if position.y > get_viewport_rect().size.y:
		queue_free()
		
func _on_body_entered(Body: Node2D) -> void:
	print("Ütközött: ", Body.name)
	if Body.is_in_group("Player"):
		var hud = get_tree().get_first_node_in_group("hud")
		if hud:
			hud.increase_score()
		else:
			print("Hiba!")
	
	queue_free()
