extends character

class_name enemy

@onready var player = get_tree().current_scene.get_node("Player")
@onready var enemies_node = get_tree().current_scene.get_node("Enemies")


#var speed and direction from Character.gd inheritance
var enemy_damage:int
var enemy_health:int
var enemy_value:int


var exp_crystal_scene:PackedScene=preload("res://Scenes/Objects/exp_crystal.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _movement():
	direction = (player.position - position).normalized()
	velocity = direction * speed
	move_and_slide()
	
func _on_enemy_death():
	var crystal = exp_crystal_scene.instantiate() as Area2D
	crystal.position = position
	crystal.value = enemy_value
	enemies_node.add_child(crystal)
	print(str(enemy_value)+" worth of EXP spawned")
	queue_free()
