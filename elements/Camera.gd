extends Camera2D

export(PackedScene) var level

func _ready():
	limit_bottom = level.MAX_HEIGH
