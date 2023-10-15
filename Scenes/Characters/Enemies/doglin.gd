extends enemy_class

var health
var damage
var value = 0


func _ready():
	speed = 125
	health = Enemy.enemy_health
	damage = Enemy.enemy_damage
	value = Enemy.enemy_value
	$RichTextLabel.text = str(value)
	
	
func _process(_delta):
	_movement()
	if health == 0:
		_on_enemy_death()
	
func _hit():
	health = 0
