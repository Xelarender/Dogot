extends object

#signal exp_pickup(value)

@onready var player = get_tree().current_scene.get_node("Player")
var speed:int = 500
var in_magnet_range:bool = false
var direction
var value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_magnet_range == true:
		direction = (player.position - position).normalized()
		position += direction * speed * delta


func _on_EXP_pickup(_body):
	Signalbus.exp_pickup.emit(value)
	queue_free()
	pass # Replace with function body.



func _on_magnet_range_entered(_body):
	in_magnet_range=true
	$Area2D.set_deferred("monitoring", false)
	
	
	pass # Replace with function body.
