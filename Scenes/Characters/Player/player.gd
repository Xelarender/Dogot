extends character



var experience:int = 0
var can_scratch:bool = true




# Called when the node enters the scene tree for the first time.
func _ready():
	Signalbus.connect("exp_pickup", _exp_pickup)
	speed = 750
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_movement()
	pass


func _movement():
	direction = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = direction * speed
	move_and_slide()

func _exp_pickup(value):
	experience += 1
	print("Total exp: "+str(experience))
