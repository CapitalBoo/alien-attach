extends Node2D

var lives = 3
var score = 0
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

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)
	enemies_spawned += 1
	print("enemies spawned: ",  enemies_spawned)
	
func _on_enemy_died():
	enemies_killed += 1
	print("enemies_killed: ",enemies_killed)
	score += 100
	print("Score: " + str(score))
	
