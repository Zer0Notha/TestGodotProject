extends Node2D
export(PackedScene) var weapon_model

var weapon


func _input(event):
	if event is InputEventMouseMotion:
		rotation = event.position.angle_to_point(position)
	elif event is InputEventMouseButton:
		weapon.shoot(rotation)
		

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon = weapon_model.instance()
	add_child(weapon)
