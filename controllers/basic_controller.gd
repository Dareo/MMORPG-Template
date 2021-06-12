extends KinematicBody

class_name BasicController

export var speed : float = 400
export var follow_speed : float = .3
export var acceleration : float = 15
export var air_acceleration : float = 5
export var gravity : float = 9.8
export var max_terminal_velocity : float = 54

export var model_path : NodePath
onready var model = get_node(model_path)

var velocity : Vector3
var y_velocity : float

var input_vector : Vector2
var dirction : Vector3

export var target_path : NodePath
onready var target = get_node(target_path) 

export var orintate_path : NodePath
onready var orintate = get_node(orintate_path)

func _physics_process(delta):
	if !target == null:
		move_to(target, delta)

	movement(delta)

func _process_movement():
	pass

func movement(delta):
	var direction = _process_movement()
	
	velocity = direction * speed * delta
	
	if is_on_floor():
		y_velocity = -0.01
	else:
		y_velocity = clamp(y_velocity - gravity, -max_terminal_velocity, max_terminal_velocity)
		
	velocity.y = y_velocity
	velocity = move_and_slide_with_snap(velocity,Vector3.DOWN)
	

	
	
func move_to(var target, delta):
	transform.interpolate_with(target.transform, speed * delta)
	
	
func ajust_facing():
	pass

