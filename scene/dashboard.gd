extends Control

@onready var zenpet = $"BoxContainer/Button"

func _ready():
	zenpet.pressed.connect(_open_zenpet)
	
func _open_zenpet():
	var zenpetscreen = load("res://scene/zenpet-main.tscn")
	get_tree().change_scene_to_packed(zenpetscreen)
