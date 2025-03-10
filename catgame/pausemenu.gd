extends Control

func _ready():
	hide()
	
func toggle_pause():
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused

	var pause_button = get_parent().get_node("HUD/Pause")
	pause_button.visible = !get_tree().paused

func _on_resume_pressed() -> void:
	print("pressed")
	toggle_pause()

func _on_menu_pressed() -> void:
	print("Pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")
