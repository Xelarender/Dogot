extends Node

signal exp_pickup(value) #exp_crystal _on_EXP_pickup emits >> player _on_ready() connects >> player _exp_pickup
signal difficulty_increase(difficulty) #spawn_manager on_wave_timer_timeout emits >> enemy on_ready() connects >> enemy _on_difficulty_increase




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
