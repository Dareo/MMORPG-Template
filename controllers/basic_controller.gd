extends KinematicBody

class_name BasicController

export var speed : float = 20
export var acceleration : float = 15
export var air_acceleration : float = 5
export var gravity : float = 9.8
export var max_terminal_velocity : float = 54

export var model_path : NodePath
onready var model = get_node(model_path)

var velocity : Vector3
var y_velocity : float

var input_vector : Vector2
var dirction : Vector2


func _process_movement(delta):
	pass

func movement():
	pass
	
func move_to():
	pass
	
func play_action():
	pass
	
func ajust_facing():
	pass

