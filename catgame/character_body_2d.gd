extends CharacterBody2D

@export var speed: float = 500  # Mozgás sebessége
@export var move_time: float = 0.3  # Mennyi ideig mozogjon egy húzás után
@export var min_swipe_distance: float = 50  # Minimális húzási távolság

var swipe_start: Vector2 = Vector2.ZERO
var swipe_end: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO
var moving: bool = false
var move_timer: float = 0.0


func _input(event):
	# Ha az ujját vagy az egér bal gombját lenyomja
	if event is InputEventScreenTouch and event.pressed or event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		swipe_start = event.position

	# Ha elhúzza az ujját vagy az egeret
	elif event is InputEventScreenDrag or event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		swipe_end = event.position

	# Ha felengedi az ujját vagy az egér bal gombját
	elif event is InputEventScreenTouch and not event.pressed or event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		swipe_end = event.position
		var swipe_length = swipe_start.distance_to(swipe_end)  # Húzás hosszának kiszámítása
		
		print("Swipe distance:", swipe_length)  # Konzolba kiírja a távolságot

		if swipe_length > min_swipe_distance:
			direction = (swipe_end - swipe_start).normalized()
			moving = true
			move_timer = move_time  # Időzítő újraindítása

func _physics_process(delta):
	if moving:
		velocity = direction * speed
		move_and_slide()
		
		# Időzítő csökkentése
		move_timer -= delta
		if move_timer <= 0:
			moving = false
			velocity = Vector2.ZERO  # Megállítja a karaktert
