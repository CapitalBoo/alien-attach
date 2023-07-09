extends Area2D

@export var enemy_speed = 200
@onready var visible_container = $VisibleNotifier

func _ready():
	visible_container.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x += -enemy_speed*delta

func _on_screen_exited():
	queue_free()

func die():
	queue_free()

func _on_body_entered(body):
	body.take_damage()
	die()
