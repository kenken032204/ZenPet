extends Control

@onready var loginbtn = $"BoxContainer/Button2"
@onready var regbtn = $"BoxContainer/Button"
@onready var username = $"BoxContainer/username-input"
@onready var email = $"BoxContainer/email-input"
@onready var month = $"BoxContainer/HBoxContainer/month-input"
@onready var day = $"BoxContainer/HBoxContainer/day-input"
@onready var year = $"BoxContainer/HBoxContainer/year-input"
@onready var password = $"BoxContainer/password-input"
@onready var confirmpass = $"BoxContainer/confirmpass-input"

func _ready():
	loginbtn.pressed.connect(_on_login_pressed)
	regbtn.pressed.connect(_on_register_pressed)

func _on_register_pressed():
	
	var loginscreen = load("res://scene/login.tscn")
	
	if password.text == confirmpass.text:
		var data = {
			"username":username.text,
			"email":email.text,
			"birthday":month.text + "" + day.text + "" + year.text,
			"password": password.text,
		}
		
		var json_string = JSON.stringify(data)
		
		var file = FileAccess.open("user://user_data.json", FileAccess.WRITE)
		file.store_string(json_string)
		file.close()
		get_tree().change_scene_to_packed(loginscreen)
		print("Data saved.")
	else:
		print("Password doesn't match!")
	
		
func _on_login_pressed():
	var loginscreen = load("res://scene/login.tscn")
	get_tree().change_scene_to_packed(loginscreen)
