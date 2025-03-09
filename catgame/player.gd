extends CharacterBody2D

var score: int = 0
var lives: int = 3

func add_score(amount: int):
	score += amount
	print("Pontszám:", score)  # Debughoz

func lose_life(amount: int):
	lives -= amount
	print("Életek:", lives)  # Debughoz
	if lives <= 0:
		print("Game Over!")  # Ide jöhet a game over logika
