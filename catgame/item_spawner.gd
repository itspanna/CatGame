extends Node2D

@export var good_item_scene: PackedScene
@export var bad_item_scene: PackedScene

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)  # Timer esemény csatlakoztatása

func _on_timer_timeout():
	spawn_item()

func spawn_item():
	# Véletlenszerűen választunk egy jó vagy rossz itemet
	var item_scene = good_item_scene if randi() % 2 == 0 else bad_item_scene
	var item = item_scene.instantiate()
	
	# Véletlenszerű X pozíció a képernyő tetején
	var viewport_width = get_viewport_rect().size.x
	item.position = Vector2(randf_range(50, viewport_width - 50), -50)
	
	# Az itemet hozzáadjuk a főjelenethez
	get_parent().add_child(item)
