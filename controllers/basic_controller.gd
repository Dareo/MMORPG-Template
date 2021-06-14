extends KinematicBody

class_name BasicController

signal take_damage
signal attack

export var speed : float = 400
export var follow_speed : float = .3
export var acceleration : float = 15
export var air_acceleration : float = 5
export var gravity : float = 9.8
export var max_terminal_velocity : float = 54
export var hit_range : int = 8

export var model_path : NodePath
onready var model = get_node(model_path)

var velocity : Vector3
var y_velocity : float

var input_vector : Vector2
var dirction : Vector3


var target = null
var can_attack : bool = false

export var orintate_path : NodePath
onready var orintate = get_node(orintate_path)

func _physics_process(delta):
	
	movement(delta)

func _process_movement():
	var direction : Vector3 = Vector3(0,0,0)
	return direction

func movement(delta):
	var direction : Vector3 = Vector3.ZERO
	if _process_movement():
		target = null
		direction = _process_movement()
	
	if direction == Vector3.ZERO or direction == null:
		if !target == null:
			if move_to(target.transform.origin, hit_range, delta):
				direction = move_to(target.transform.origin, hit_range, delta)
		else:
			return
			
		
	
	
	velocity = direction * speed * delta
	
	if is_on_floor():
		y_velocity = -0.01
	else:
		y_velocity = clamp(y_velocity - gravity, -max_terminal_velocity, max_terminal_velocity)
		
	velocity.y = y_velocity
	move_and_slide_with_snap(velocity,Vector3.DOWN)
	
	
	
func move_to(var target, var distance_from_target , delta):
	
	var direction : Vector3
	
	if target.distance_to(transform.origin) > distance_from_target:
		direction = target - transform.origin
		direction = direction.normalized() 
		return direction


func _take_damage():
	pass
	
func _attack():
	pass
	
func ajust_facing():
	pass

