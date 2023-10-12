extends Node2D

# Called when the node enters the scene tree for the first time.

var scratch_scene: PackedScene = preload("res://Scenes/Attacks/scratch.tscn")
var exp_crystal_scene: PackedScene = preload("res://Scenes/Objects/exp_crystal.tscn")

signal spawn_exp

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_scratch(lookdirection):
	var scratch = scratch_scene.instantiate() as Area2D
	scratch.rotation_degrees = rad_to_deg(lookdirection.angle()) + 90
	$Player/PlayerMeleeProjectiles.add_child(scratch)
	pass # Replace with function body.


func _on_enemy_enemy_death(value):
	var crystal = exp_crystal_scene.instantiate() as Area2D
	print(value)
	$EXP.add_child(crystal)
	pass # Replace with function body.
