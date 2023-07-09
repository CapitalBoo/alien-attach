extends Node2D

var lives = 3
var shots_fired = 0
var enemies_spawned = 0
var enemies_killed = 0

@onready var player = $Player

func _on_deathzone_area_entered(area):
	area.die()

func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		print("Game Over Man!")
		player.die()
	else:
		print("lives: ",lives)

func _on_player_fired_shot():
	shots_fired += 1
	print("shots fired: ", shots_fired)

func _on_enemy_spawner_enemy_spawned():
	enemies_spawned += 1
	print("enemies spawned: ",  enemies_spawned)
	

