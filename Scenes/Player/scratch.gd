extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if "_hit" in body:
		body._hit()
	pass # Replace with function body.


func _on_self_destruct_timeout():
	queue_free()
	pass # Replace with function body.
