extends Node2D


var speed:int = 5
var radius:float = .25
var yarn_damage:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$YarnBall.position = Vector2(25,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += speed *delta
	if $YarnBall.position <= Vector2(100,0):
		$YarnBall.position += Vector2(radius,0)


func _on_yarn_ball_body_entered(body):
	body._hit_yarn(yarn_damage)
	pass # Replace with function body.
