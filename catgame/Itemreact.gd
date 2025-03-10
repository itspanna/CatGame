extends CharacterBody2D

func _on_area_entered(area):
	if area.is_in_group("good_item"):
		get_parent().increase_score(1)
		area.queue_free()
	elif area.is_in_group("bad_item"):
		get_parent().decrease_hp(1)
		area.queue_free()
