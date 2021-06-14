extends BasicController

class_name Character

export var character_name : String = "- insert name -"

onready var job = $Class
onready var stats = $Stats
onready var buffs = $Buffs
onready var equipment = $Equipment
onready var invetory = $Inventory
onready var attack_timer = $attack_timer

var selectable_targets : Array
var in_attack_range = false


func _process_movement():
	var direction = Vector3()
	
	
	if Input.is_action_pressed("forward"):
		direction -= orintate.transform.basis.z
	if Input.is_action_pressed("back"):
		direction += orintate.transform.basis.z
	if Input.is_action_pressed("left"):
		direction -= orintate.transform.basis.x
	if Input.is_action_pressed("right"):
		direction += orintate.transform.basis.x
	return direction.normalized()


func _process(delta):
	if Input.is_action_just_pressed("attack") and selectable_targets.size() > 0:
		if target:
			attack_timer.start()
		else:
			select_mob()
			
		


func _attack():
	target._take_damage()


func _take_damage():
	emit_signal("take_damage")


func body_entered_range(body):
	if body.is_in_group("monster"):
		selectable_targets.append(body)

func body_left_range(body):
	if body in selectable_targets:
		selectable_targets.erase(body)


func inside_attack_range(body):
	in_attack_range = true


func outside_attack_range(body):
	in_attack_range = false
	attack_timer.stop()


func select_mob():
	target = selectable_targets[0]


func attack_rate():
	if target:
		emit_signal("attack")
