extends Control

@onready var email_input = $EmailInput
@onready var password_input = $Password
@onready var error_label = $ErrorLabel

var firebase_auth = null

func _ready():
	firebase_auth = Firebase.Auth
	firebase_auth.connect("sign_in_succeeded", Callable(self,"_on_login_success"))
	firebase_auth.connect("sign_in_failed", Callable(self, "_on_login_failed"))
	
func _on_login_pressed():
	var email = email_input.text
	var password = password_input.text

	if email.is_empty() or password.is_empty():
		error_label.text = "Fill all labels!"
		return
		
		firebase_auth.sign_in(email, password)
	
func _on_login_success(user_id):
	print("Login success! Welcome, ", user_id)
	get_tree().change_scene_to_file("res://profile.tscn")

func _on_login_failed(error):
	error_label.text = "Login error" + error
