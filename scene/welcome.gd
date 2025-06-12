extends Control

@onready var loginbtn = $"BoxContainer/Button"
@onready var registerbtn = $"BoxContainer/Button2"

func _ready():
	loginbtn.pressed.connect(_on_login_pressed)
	registerbtn.pressed.connect(_on_register_pressed)

func _on_login_pressed():
	var loginscreen = load("res://scene/login.tscn")
	get_tree().change_scene_to_packed(loginscreen)

func _on_register_pressed():
	var registerscreen = load("res://scene/register.tscn")
	get_tree().change_scene_to_packed(registerscreen)
