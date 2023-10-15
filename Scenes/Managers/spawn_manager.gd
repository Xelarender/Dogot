extends Node2D

var selected_enemy:PackedScene
var selected_shape
@export var difficulty:int
var monster_change:bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	selected_shape = $"Spawners - Circle"
	difficulty = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if difficulty == 1 and monster_change == true:
		selected_enemy = preload("res://Scenes/Characters/Enemies/doglin.tscn")
		print("level 1 doglin spawning")
		monster_change=false
	if difficulty == 5 and monster_change == true:
		selected_enemy = preload("res://Scenes/Characters/Enemies/doglin.tscn")
		print("level 5 doglin spawning")
		monster_change=false
	if difficulty == 10 and monster_change == true:
		selected_enemy = preload("res://Scenes/Characters/Enemies/doglin.tscn")
		print("level 10 doglin spawning")
		selected_shape = $"Spawners - Rectangle"
		monster_change=false


func _on_spawn_timer_timeout():
	var spawnpoints = selected_shape.get_children()
	var selected_spawn = spawnpoints[randi()%spawnpoints.size()]
	var enemyspawn = selected_enemy.instantiate() as CharacterBody2D
	enemyspawn.position = selected_spawn.global_position
#	enemyspawn._set_stats(Enemy.enemy_health, Enemy.enemy_damage, Enemy.enemy_value)
	$"../../Enemies".add_child(enemyspawn) 


func _on_wave_timer_timeout():
	var spawntime:float = $SpawnTimer.wait_time
	$SpawnTimer.set_wait_time(spawntime - 0.1)
	difficulty +=1
	monster_change = true
	print("New Wave!")
	print("Now spawning every "+str($SpawnTimer.wait_time)+" seconds!")
	print("Level "+str(difficulty)+" monsters now spawning!")
	Signalbus.difficulty_increase.emit(difficulty)
