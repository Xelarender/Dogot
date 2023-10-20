extends character

class_name enemy_class

@onready var player = get_tree().current_scene.get_node("Player")
@onready var objects_node = get_tree().current_scene.get_node("Objects")


#var speed and direction from Character.gd inheritance
@export var enemy_damage:float = 1
@export var enemy_health:float = 1
@export var enemy_value:float = 1


var exp_crystal_scene:PackedScene=preload("res://Scenes/Objects/exp_crystal.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	Signalbus.connect("difficulty_increase", _on_difficulty_increase)
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
	crystal.value = self.value
	objects_node.add_child(crystal)
	print(str(self.value)+" worth of EXP spawned")
	queue_free()	
	
func _on_difficulty_increase(difficulty):
	enemy_damage = difficulty
	enemy_health = difficulty * 1.5
	enemy_value = difficulty
	

func _hit_scratch(scratch_damage):
	self.health -= scratch_damage
	print("scratch hit")

func _hit_yarn(yarn_damage):
	self.health -= yarn_damage
	print("yarn hit")
