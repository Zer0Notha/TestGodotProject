extends Sprite

export(PackedScene) var bullet_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func shoot(rot):
	var bullet = bullet_scene.instance()
	
	bullet.linear_velocity = Vector2(200.0, 0.0).rotated(rot)
	
	add_child(bullet)
