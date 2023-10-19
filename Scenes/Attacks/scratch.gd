extends Area2D


@onready var player = get_tree().current_scene.get_node("Player")

#var can_scratch_attack:bool = true
var scratch_damage:int = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_body_entered(body):
#	Signalbus.outgoing_damage.emit(scratch_damage)
	body._hit_scratch(scratch_damage)

func _scratch_attack():
	$".".visible = true
	$CollisionPolygon2D.disabled = false
	$AudioStreamPlayer2D.play()
	$AnimationPlayer.play("scratch")
	await $AnimationPlayer.animation_finished
	$".".visible = false
	$CollisionPolygon2D.disabled = true
