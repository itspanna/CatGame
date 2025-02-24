extends Button

@onready var pause_menu =  get_tree().root.get_node("Node2D/PauseMenu")
func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	pause_menu.toggle_pause()
	
