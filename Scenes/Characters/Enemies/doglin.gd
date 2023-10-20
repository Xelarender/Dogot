extends enemy_class

var max_health
var health
var doglin_damage
var value = 0


func _ready():
	speed = 75
	health = floor(Enemy.enemy_health) #doglin scaling based off enemy_health (difficulty)
	doglin_damage = Enemy.enemy_damage
	value = Enemy.enemy_value
	max_health = floor(Enemy.enemy_health)
#	Signalbus.connect("outgoing_damage", _hit_scratch)


func _process(_delta):
	$RichTextLabel.text = str(value)+"    "+str(health)+"/"+str(max_health)
	_movement()
	if health <= 0:
		_on_enemy_death()
	

#func _hit_scratch(scratch_damage):
#	super(scratch_damage)
#	self.health -= scratch_damage
#	print("scratch hit")
	
#func _hit_yarn(yarn_damage):
#	self.health -= yarn_damage
#	print("yarn hit")

