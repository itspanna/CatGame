extends Node2D

#HULYE UNDORITO PAUSE GOMB AMUGY XDDDD NEM MUKODIK MÉG RÁK EGYE MEG 
#ÖLJETEK MEG PLS

@onready var pause_menu = $PauseMenu  # Pause menü referenciája
@onready var pause_button = $HUD/Pause  # Hivatkozás a Pause gombra

func _ready():
	if not pause_button.pressed.is_connected(_on_pause_pressed):
		pause_menu.toggle_pause()

func _input(event):
	if event.is_action_pressed("escape"):  # ESC gombbal is működjön
		pause_menu.toggle_pause()

func _on_pause_pressed() -> void:
	pause_menu.toggle_pause() # Replace with function body.
