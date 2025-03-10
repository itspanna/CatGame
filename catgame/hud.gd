#extends CanvasLayer

#var pont_collected = 0 
#var hp: int = 3

#@onready var goodtem = $good_item
#@onready var badtem = $bad_item

#func _ready():
	#$Counter.text = "Pontok: " + str(pont_collected)
	
#func update_hp_display():
	#$HP.text = "HP: " + str(hp)

#func decrease_hp():
	#hp -= 1
	#update_hp_display()
	
	#if hp <= 0:
		#game_over()

#func game_over():
	#$HP.text = "Game over"
	#get_tree().paused = true
	
	
#func _on_good_item_body_entered(body:Area2D) -> void:
	#print("Ütközött: ", body.name)  # Kiírja, melyik objektumot érzékelte
	#pont_collected += 1  
	#$Counter.text = "Pontok: " + str(pont_collected)
	#body.queue_free()
	

extends CanvasLayer

var hp: int = 3
var score: int = 0

func _ready():
	update_hp_display()
	update_score_display()

func update_hp_display():
	if $HP:
		$HP.text = "HP: " + str(hp)

func update_score_display():
	if $pontszamlalo:
		print("Pontszám frissítve: ", score)  # Debug üzenet
		$pontszamlalo.text = "Points: " + str(score)

func decrease_hp():
	hp -= 1
	update_hp_display()

	if hp <= 0:
		game_over()

func increase_score():
	score += 1
	update_score_display()

func game_over():
	$HP.text = "HP: 0 "
	get_tree().paused = true
	get_tree().change_scene_to_file("res://GameOver.tscn")
