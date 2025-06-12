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
		var dashboard = load("res://scene/dashboard.tscn")
		get_tree().change_scene_to_packed(dashboard)
