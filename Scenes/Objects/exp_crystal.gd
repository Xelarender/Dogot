extends Area2D

var value:int
var direction:Vector2
var vacuum:bool = false
@onready var player = get_tree().current_scene.get_node("Player")
signal pickup_exp(value)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	direction = (player.position - position).normalized()
	vacuum = true
#	print(vacuum)
#	if vacuum == true:
#		direction = (player.position - position).normalized()
#		velocity = direction * speed
		

func _on_Pickup_range_body_entered(body):
	print("vacuum")
	pass # Replace with function body.


func _on_body_entered(body):
	print("plink")
	print(value)
	pickup_exp.emit(value)
	pass # Replace with function body.
	
