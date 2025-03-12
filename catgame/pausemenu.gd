extends Control

@onready var resume_button = $ResumeButton
@onready var menu_button = $MenuButton

func _ready():
	hide()  # Kezdetben elrejti a pause menüt

func toggle_pause():
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused

func _on_resume_button_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_menu_button_pressed() -> void:
	print("Menu gomb")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")
