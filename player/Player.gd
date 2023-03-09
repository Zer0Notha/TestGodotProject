extends KinematicBody2D


const GRAVITY = 300.0
const WALK_SPEED = 200
const JUMP_FORCE = 200

var jump_count = 0
var health = 100
var velocity = Vector2()

onready var sprite : AnimatedSprite = get_node("AnimatedSprite") 

func _physics_process(delta):
	if is_on_floor():
		if velocity.y > 200:
			decrease_health(10)
		velocity.y = 0
		jump_count = 0
	if is_on_ceiling() and velocity.y < 0:
		velocity.y = 0
	if not is_on_floor():
		velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		if is_on_floor():
			sprite.set_animation("run")
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		if is_on_floor():
			sprite.set_animation("run")
		velocity.x =  WALK_SPEED
	else:
		if is_on_floor():
			sprite.set_animation("idle")
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		if jump_count == 0:
			jump_count += 1
			sprite.set_animation("jump")
			velocity.y = -JUMP_FORCE
		elif jump_count == 1:
			jump_count += 1
			sprite.set_animation("double_jump")
			velocity.y = -JUMP_FORCE
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true	
	move_and_slide(velocity, Vector2(0, -1))
func set_health(hp):
	health = hp
	if(health < 0):
		health = 0
	if(health > 100):
		health = 100
func decrease_health(hp):
	sprite.play("damage")
	health -= hp
	if(health < 0):
		health = 0
func increase_health(hp):
	health += hp
	if(health > 100):
		health = 100
