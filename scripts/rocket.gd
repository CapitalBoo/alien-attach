extends Area2D

@export var rocket_speed = 300
@onready var visible_container = $VisibleNotifier

func _ready():
	visible_container.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x += rocket_speed*delta

func _on_screen_exited():
	queue_free()

func _on_area_entered(area):
	queue_free()
	area.die()
