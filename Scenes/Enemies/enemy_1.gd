extends Enemy

var direction = Vector2.UP
var player_position
var target_position
@onready var player = get_tree().current_scene.get_node("Player")

var exp_crystal_scene: PackedScene = preload("res://Scenes/Objects/exp_crystal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_movement()





func _movement():
	direction = (player.position - position).normalized()
	velocity = direction * speed
	move_and_slide()


func _on_enemy_death(value):
	var crystal = exp_crystal_scene.instantiate() as Area2D
	crystal.position = position
	crystal.value = value
	print(value)
	$"../EXP".call_deferred("add_child", crystal)
	pass # Replace with function body.
