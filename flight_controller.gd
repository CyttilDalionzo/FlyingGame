
extends RigidBody

func _ready():
	# Initialization here
	set_mass(5)
	set_process(true)
	set_process_input(true)
	set_linear_velocity(Vector3(0,0,60))
	OS.set_window_fullscreen(true)
	pass

func _process(delta):
	var lift = 0.02
	var drag = 0.01
	
	# Get the transform, and center it
	var m = get_transform()
	m[3] = Vector3()
	# then translate everything according to it
	
	var local_velocity = m.xform_inv(get_linear_velocity())
	apply_impulse(Vector3(0, 0, 0), m.xform(Vector3(0, lift, 0)*-local_velocity.y*(abs(local_velocity.z)+1)))
	apply_impulse(m.xform(Vector3(0, 0.05, -0.1)), m.xform(Vector3(0.01, 0, 0)*-local_velocity.x*(abs(local_velocity.z)+1)))
	
	if Input.is_action_pressed("full_throttle"):
		apply_impulse(Vector3(0, 0, 0), m.xform(Vector3(0, 0, 1)))
	
	
	if (Input.is_action_pressed("pitch_up")):
		apply_impulse(m.xform(Vector3(0, 0, -3)), m.xform(Vector3(0, -0.01, 0))*abs(local_velocity.z)*0.01)
	
	if (Input.is_action_pressed("pitch_down")):
		apply_impulse(m.xform(Vector3(0, 0, -3)), m.xform(Vector3(0, 0.01, 0))*abs(local_velocity.z)*0.01)
	
	if (Input.is_action_pressed("roll_left")):
		apply_impulse(m.xform(Vector3(-3, 0, 0)), m.xform(Vector3(0, 0.15, 0))*abs(local_velocity.z)*0.01)
	
	if (Input.is_action_pressed("roll_right")):
		apply_impulse(m.xform(Vector3(3, 0, 0)), m.xform(Vector3(0, 0.15, 0))*abs(local_velocity.z)*0.01)
	
	#get_node("CameraTurn/Camera/Label").set_text(str(local_velocity.z))
	pass

func _input(event):
	get_node("CameraTurn/Camera/Label").set_text(str(event))
	pass
