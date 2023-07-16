extends Node2D

var lives = 3
var score = 0
var shots_fired = 0
var enemies_spawned = 0
var enemies_killed = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_damaged_Sound = $PlayerDamagedSound

var game_over_screen = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()

func _on_player_took_damage():
	lives -= 1
	hud.set_lives_label(lives)
	player_damaged_Sound.play()
	if lives == 0:
		print("Game Over Man!") # TODO: Cleanup print debug output!
		player.die()
		
		await get_tree().create_timer(1.25).timeout
		
		var gos = game_over_screen.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
	else:
		print("lives: ",lives) # TODO: Cleanup print debug output!

func _on_player_fired_shot():
	shots_fired += 1
	print("shots fired: ", shots_fired) # TODO: Cleanup print debug output!

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)
	enemies_spawned += 1
	print("enemies spawned: ",  enemies_spawned) # TODO: Cleanup print debug output!
	
func _on_enemy_died():
	enemies_killed += 1
	score += 100
	enemy_hit_sound.play()
	hud.set_score_label(score)
	print("enemies_killed: ",enemies_killed) # TODO: Cleanup print debug output!
	print("Score: " + str(score)) # TODO: Cleanup print debug output!
