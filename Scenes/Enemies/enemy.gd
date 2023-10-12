extends CharacterBody2D

class_name Enemy

var health:int
var speed:int = 100
var incoming_damage:int
var outgoing_damage:int

var value:int = 2



signal enemy_death(value)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _hit():
#	health -= incoming_damage
#	print("Enemy hit for "+str(incoming_damage)+ "and now has "+str(health)+" health!")
#	if health == 0:
	_die()
		
		
		
		
func _die():
	enemy_death.emit(value)
	queue_free()

	pass # Replace with function body.
