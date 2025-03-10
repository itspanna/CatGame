extends Control

@onready var email_input = $EmailInput
@onready var password_input = $PasswordInput
@onready var username_input = $UsernameInput
@onready var error_label = $ErrorLabel

var firebase_auth = null

func _ready():
	firebase_auth = Firebase.Auth
	firebase_auth.connect("sign_up_Succeeded", Callable(self, "_on_signup_success"))
	firebase_auth.connect("sign_up_failed", Callable(self, "_on_signup_failed"))

func _on_register_pressed():
	var email = email_input.text
	var password = password_input.text
	var username = username_input.text
	
	if email.is_empty() or password.is_empty() or username.is_empty():
		error_label.text = "Fill all Labels!"
		return
	
	firebase_auth.sign_up(email, password)
	
func _on_signup_success(user_id):
	print("Registration success!", user_id)
	save_user_to_firestore(user_id)

func _on_signup_failed(error):
	error_label.text = "Hiba: " + error

func save_user_to_firestore(user_id):
	var firestore = Firebase.Firestore
	firestore.set_document("users", user_id, {
		"username": username_input.text,
		"email": email_input.text,
		"record": 0
	})
