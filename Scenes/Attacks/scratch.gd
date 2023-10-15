extends Area2D


@onready var player = get_tree().current_scene.get_node("Player")

var can_scratch_attack:bool = true



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


func _scratch_attack():
	$".".visible = true
	$CollisionPolygon2D.disabled = false
	$AudioStreamPlayer2D.play()
	$AnimationPlayer.play("scratch")
	print("scratching")
	await $AnimationPlayer.animation_finished
	$".".visible = false
	$CollisionPolygon2D.disabled = true
	
#	player.can_scratch = false
