extends Spatial

export(float, 0.1, 1) var mouse_sensitivity : float = 0.3
export(float, -90, 0) var min_pitch : float = -90
export(float, 0, 90) var max_pitch : float = 90

onready var camera_pivot = $CameraPivotV
onready var boom = $CameraPivotV/CameraBoom

var scroll_speed = .3
var max_lengh = 10
var min_lengh = 2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func  _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		camera_pivot.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		camera_pivot.rotation_degrees.x = clamp(camera_pivot.rotation_degrees.x, min_pitch, max_pitch)
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			
			if event.button_index == BUTTON_WHEEL_UP:
				boom.spring_length += scroll_speed
			if event.button_index == BUTTON_WHEEL_DOWN:
				boom.spring_length -= scroll_speed
			boom.spring_length = clamp(boom.spring_length, min_lengh, max_lengh)
			
			# call the zoom function	
	
