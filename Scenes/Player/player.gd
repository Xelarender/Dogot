extends CharacterBody2D

@export var speed:int = 100
@export var max_speed:int = 500
var direction
var can_scratch:bool = true

signal scratch(lookdirection)



func _ready():
	pass


func _process(_delta):
	
	direction = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = direction * speed
	move_and_slide() #automatically applies delta, no need for * delta in the velocity equation

	
	if Input.is_action_pressed("Primary_Action") and can_scratch:
		var lookdirection = (get_global_mouse_position() - position).normalized()
		$ScratchTimer.start()
		can_scratch = false
		scratch.emit(lookdirection)
		print("Scratched towards" +str(lookdirection))
	


func _on_scratch_timer_timeout():
	can_scratch = true
	pass # Replace with function body.
