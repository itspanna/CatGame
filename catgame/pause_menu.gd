extends Control

func _ready():
	if $ResumeButton:
		$ResumeButton.pressed.connect(_on_resume_button_pressed)
	else:
		print("HIBA: ResumeButton nem található!")


func _on_resume_button_pressed() -> void:
	print("Resume gomb megnyomva!")  # Debug üzenet
	get_tree().paused = false  # Folytatja a játékot
	queue_free() # Replace with function body.
