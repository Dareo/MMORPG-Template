extends BasicController

class_name Monster

onready var skills = $Skills
onready var monsterstats = $MonsterStats
onready var buffs = $Buffs
onready var idle_timer = $idle_timer
onready var attack_timer = $attack_timer
onready var is_boss : bool = false

func _process_movement():
	pass



func _on_Select_body_entered(body):
	if body is Character:
		print(body.name)
		self.target = body


func body_entered_detection_range(body):
	if body is Character:
		target = body
		attack_timer.start()
		idle_timer.stop()


func stop_follow_range(body):
	if body == target:
		target = null
		attack_timer.stop()
		idle_timer.start()


func body_in_attack_range(body):
	self.can_attack = true


func body_left_attack_range(body):
	self.can_attack = false


func attack_cycle():
	if can_attack:
		emit_signal("attack")
		print("attack atempt sucessfull!")
	else:
		print("target out of range ...")


func idle_cycle():
	if can_attack == false:
		print("mob is ideling ...")


func _attack():
	target._take_damage()
