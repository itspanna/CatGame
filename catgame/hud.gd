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
