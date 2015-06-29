
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
	pass

