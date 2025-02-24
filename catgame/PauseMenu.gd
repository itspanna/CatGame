extends CanvasLayer
@onready var resume_button = $Resume
@onready var quit_button = $Quit

func _ready():
	hide()  # Alapból el van rejtve

func toggle_pause():
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused  # Megjelenik, ha a játék szünetel

func _on_resume_pressed():
	toggle_pause()  # Folytatja a játékot

func _on_quit_pressed():
	get_tree().quit()  # Kilép a játékból
