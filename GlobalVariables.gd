extends Node

export(PackedScene) var Player



func _ready():
	Player = get_node("/root/Main/Player")
