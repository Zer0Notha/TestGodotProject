extends Node2D




func _ready():
	var player : KinematicBody2D = get_node("/root/GlobalVariables").Player
	var camera = get_node("Camera2D")
	player.add_child(camera)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
