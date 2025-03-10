extends Node2D

@onready var username_label = $Usernamelabel
@onready var email_label = $EmailLabel
@onready var record_label = $RecordLabel

var firebase_auth = null
var firestore = null
var user_id = ""

func _ready():
	firebase_auth = Firebase.Auth
	firestore = Firebase.Firestore

	user_id = firebase_auth.get_user_id()
	if user_id:
		firestore.get_document("users", user_id, Callable(self, "_on_user_data_received"))

func _on_user_data_received(data):
	if data:
		username_label.text = "Username: " + data["username"]
		email_label.text = "Email: " + data["email"]
		record_label.text = "Record: " + str(data["record"])

func _on_logout_pressed():
	firebase_auth.sign_out()
	get_tree().change_scene_to_file("res://login_screen.tscn")
	
func _on_delete_account_pressed():
	firestore.delete_document("users", user_id)
	firebase_auth.delete_account()
	get_tree().change_scene_to_file("res://Register_screen.tscn")
