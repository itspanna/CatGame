extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

func _on_mob_timer_timeout():
	#...
	# We connect the mob to the score label to update the score upon squashing one.
	$good_item.squashed.connect($HUD/Counter._on_mob_squashed.bind())
	
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
