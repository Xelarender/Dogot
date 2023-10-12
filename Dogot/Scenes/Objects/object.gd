extends Area2D

class_name object


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_object_pickup(body):
	print(str(self)+" was picked up")
	pass # Replace with function body.


