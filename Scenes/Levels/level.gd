extends Node2D

# Called when the node enters the scene tree for the first time.

var scratch_scene: PackedScene = preload("res://Scenes/Enemies/scratch.tscn")


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_player_scratch(pos, lookdirection):
	var scratch = scratch_scene.instantiate() as Area2D
	scratch.rotation_degrees = rad_to_deg(lookdirection.angle()) + 90
	scratch.position = pos
	$Projectiles.add_child(scratch)
	pass # Replace with function body.
