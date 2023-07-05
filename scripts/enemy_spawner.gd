extends Node2D

@onready var timer_container = $Timer

#func _ready():
#	timer_container.connect("timeout", spawn())

func _on_timer_timeout():
	spawn()

func spawn():
	print("spawm me an alien")
