extends CharacterBody2D

@onready var anim = get_node("AnimationPlayer")


@export var speed:int = 100
@export var max_speed:int = 500
var direction
var can_scratch:bool = true

signal scratch(pos, lookdirection)




func _ready():
	pass


func _process(_delta):
	
	# might have to create 'idle' function/routine?
	
	_movement()

	_scratch()



	
func _scratch():
	
	if Input.is_action_pressed("Primary_Action") and can_scratch:
		var lookdirection = (get_global_mouse_position() - position).normalized()
		var pos = position
		$ScratchTimer.start()
		if lookdirection.x > 0:
			get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
		anim.play("scratch")
		can_scratch = false
		scratch.emit(pos, lookdirection)
		await anim.animation_finished
		anim.play("RESET")
#		print("Scratched towards" +str(pos, lookdirection))
	

func _movement():
	direction = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = direction * speed
	move_and_slide() #automatically applies delta, no need for * delta in the velocity equation

func _on_scratch_timer_timeout():
	can_scratch = true
	pass # Replace with function body.
