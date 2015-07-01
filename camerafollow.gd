
extends Spatial

# member variables here, example:
var zoom_factor = 1.1

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if event.is_action("scroll_up"):
		set_scale(get_scale()*(1/zoom_factor))
	
	if event.is_action("scroll_down"):
		set_scale(get_scale()*zoom_factor)
	
	if event.type == InputEvent.MOUSE_MOTION and Input.is_action_pressed("turn_camera"):
		set_rotation(get_rotation()+Vector3(0, -event.relative_pos.x, 0)*0.01)
		get_node("CameraTurnVertical").set_rotation(get_node("CameraTurnVertical").get_rotation() + Vector3(event.relative_pos.y, 0, 0)*0.01)
	
	pass

