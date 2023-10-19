extends character

@onready var anim = get_node("AnimationPlayer")

var experience:float = 0
var can_scratch:bool = true
var level:int = 1
var levelconstant:float = 0.1
var levelpower:float = 1.25

signal scratch(pos, lookdirection)


# Called when the node enters the scene tree for the first time.
func _ready():
	Signalbus.connect("exp_pickup", _exp_pickup)
	speed = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_movement()
	$RichTextLabel.text = "Total EXP: " +str(experience)# +" Level: "+str(level)
	_scratch_animation()
	_scratch_attack()
	pass


func _movement():
	direction = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = direction * speed
	move_and_slide()

func _exp_pickup(value):
	experience += value
	print("Total exp: "+str(experience))
	
	
func _scratch_animation():
	if Input.is_action_pressed("Primary_Action") and can_scratch:
		$ScratchCooldown.start()
		var lookdirection = (get_global_mouse_position()-position).normalized()
		if lookdirection.x > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
		anim.play("scratch")
		await anim.animation_finished
		anim.play("RESET")
		can_scratch = false
		
func _scratch_attack():
	if Input.is_action_pressed("Primary_Action") and can_scratch:
		$ScratchCooldown.start()
		var lookdirection = (get_global_mouse_position()-position).normalized()
		$Scratch.rotation_degrees = rad_to_deg(lookdirection.angle()) + 90
		$Scratch._scratch_attack()
		can_scratch = false
		

func _on_scratch_cooldown_timeout():
	can_scratch = true
	pass # Replace with function body.
	


