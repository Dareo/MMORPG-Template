extends BasicController

class_name Character

export var character_name : String = "- insert name -"

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
