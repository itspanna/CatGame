extends Control

func _on_replay_button_pressed():
	print("pressed")
	get_tree().change_scene_to_file("res://game.tscn") # Replace with function body.

func _on_main_menu_button_pressed():
	print("Pressed")
	get_tree().change_scene_to_file("res://MainMenu.tscn")
