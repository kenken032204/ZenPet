extends Control

@onready var loginbtn = $"BoxContainer/Button2"

func _ready():
	loginbtn.pressed.connect(_on_login_pressed)

func _on_login_pressed():
	var loginscreen = load("res://scene/login.tscn")
	get_tree().change_scene_to_packed(loginscreen)
