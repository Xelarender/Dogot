extends object

#signal exp_pickup(value)

@onready var player = get_tree().current_scene.get_node("Player")
var speed:int = 500
var value:int
var in_magnet_range:bool = false
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_magnet_range == true:
		direction = (player.position - position).normalized()
		position += direction * speed * delta


func _on_EXP_pickup(body):
	Signalbus.emit_signal("exp_pickup", value)
	queue_free()
	pass # Replace with function body.




func _on_magnet_range_entered(body):
	print("vacuum time")
	in_magnet_range=true
	
	
	pass # Replace with function body.
