extends Node2D

var enemy: PackedScene = preload("res://Scenes/Enemies/enemy_1.tscn")

#var spawnpoints = $Spawners.get_children()
#var selected_spawn = spawnpoints[randi() % spawnpoints.size()]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_spawn_timer_timeout():
	var spawnpoints = $Spawners.get_children()
	var selected_spawn = spawnpoints[randi() % spawnpoints.size()]
	print(selected_spawn)
	var enemyspawn = enemy.instantiate() as CharacterBody2D
	enemyspawn.position = selected_spawn.global_position
	print("enemy spawned at " +str(enemyspawn.position))
	$"../../Enemies".add_child(enemyspawn)
	pass # Replace with function body.
