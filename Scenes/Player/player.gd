extends CharacterBody2D

var speed:int = 100
var max_speed:int = 500
var direction

func _ready():
	pass


func _process(_delta):
	
	direction = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = direction * speed
	move_and_slide() #automatically applies delta, no need for * delta in the velocity equation
