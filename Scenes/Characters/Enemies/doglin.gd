extends enemy




func _ready():
	enemy_health=1
	enemy_value=1
	pass
	
	
	
	
func _process(delta):
	if enemy_health == 0:
		_on_enemy_death()
	pass





func _on_area_2d_body_entered(body):
	enemy_health = 0
	pass # Replace with function body.
