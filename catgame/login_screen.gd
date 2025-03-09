extends Control


var username = ""
var password

var created = false

func _on_login_button_pressed():
	pass

func _on_login_pressed() -> void:
	pass # Replace with function body.
	if created : 
		print ("Account login")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu.tscn") # Replace with function body.
