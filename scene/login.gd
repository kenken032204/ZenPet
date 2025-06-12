extends Control

@onready var loginbtn = $"BoxContainer/Button"
@onready var username = $"BoxContainer/LineEdit"
@onready var password = $"BoxContainer/LineEdit2"

func _ready():
	loginbtn.pressed.connect(_on_login_pressed)

func _on_login_pressed():
	if username.text.strip_edges() == "":
		print("Username is required.")
		return
	elif password.text.strip_edges() == "":
		print("Password is required.")
		return
	else:
		var data = load_data()
		if data:
			if username.text == data.get("username", "") and password.text == data.get("password", ""):
				print("Login successful.")
				var dashboard = load("res://scene/dashboard.tscn")
				get_tree().change_scene_to_packed(dashboard)
			else:
				print("Invalid username or password.")
		else:
			print("No user data found.")

func load_data():
	if FileAccess.file_exists("user://user_data.json"):
		var file = FileAccess.open("user://user_data.json", FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var result = JSON.parse_string(content)
		if typeof(result) == TYPE_DICTIONARY:
			return result
		else:
			print("Failed to parse JSON.")
	else:
		print("User data file not found.")
	return null
