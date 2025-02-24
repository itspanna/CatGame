extends Area2D

var speed = 300  # Item esési sebessége

func _ready():
	add_to_group("bad_item")

func _physics_process(delta):
	position.y += speed * delta  # Item esik lefelé

	# Ha kimegy a képernyőről, törlődik
	if position.y > get_viewport_rect().size.y:
		queue_free()
