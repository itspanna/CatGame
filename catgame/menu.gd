extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")  


func _on_quit_pressed() -> void:
	get_tree().quit() 

func _on_login_pressed() -> void: 
	get_tree().change_scene_to_file("res://login_screen.tscn")
