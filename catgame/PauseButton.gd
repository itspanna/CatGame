extends Button

@onready var pause_menu = $"../../PauseMenu"

func _ready():
	connect("pressed", Callable(self, "_on_pause_pressed"))


func _on_pressed() -> void:
	print("Pause")
	pause_menu.toggle_pause()
	
