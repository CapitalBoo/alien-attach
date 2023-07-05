extends CharacterBody2D

var speed = 325
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer

func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	
	move_and_slide()
	#print(velocity)

	# Check if player is past boundaries and repostion accordingly
	var screen_size = get_viewport_rect().size
	
	# Basic method: if statements to check using the screen rect from viewport
#	if global_position.x < 0:
#		global_position.x = 0
#	if global_position.x > screen_size.x:
#		global_position.x = screen_size.x
#	if global_position.y < 0:
#		global_position.y = 0
#	if global_position.y > screen_size.y:
#		global_position.y = screen_size.y
#	print(global_position)

	# advanced methos to use clampf built-in function
#	global_position.x = clampf(global_position.x, 0, screen_size.x)
#	global_position.y = clampf(global_position.y, 0, screen_size.y)

	# Hyper-optimized using Godot built-in clamp as part of global_position
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 75
