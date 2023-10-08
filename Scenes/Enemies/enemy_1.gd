extends CharacterBody2D

var direction = Vector2.UP
var speed = 50



var player_position
var target_position
@onready var player = get_tree().current_scene.get_node("Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	direction = (player.position - position).normalized()
	velocity = direction * speed
	move_and_slide()
	pass
