extends Node2D

var speed:int = 3
var radius:float = 0.3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Frisbee.position += Vector2(radius,0)
	rotation -= speed * delta
	pass
