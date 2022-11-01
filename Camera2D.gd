extends Camera2D

@export
var speed = 10

var is_panning

var cam_right_down:bool
var cam_left_down:bool
var cam_up_down:bool
var cam_down_down:bool


func _process(delta):
	if cam_right_down:
		global_position.x += speed
	if cam_left_down:
		global_position.x -= speed
	if cam_up_down:
		global_position.y -= speed
	if cam_down_down:
		global_position.y += speed
	
	is_panning = Input.is_action_pressed("middle_click")
	
	

func _unhandled_input(event):
	if event is InputEventKey:
		
		if event.is_action("camera_right") and event.is_pressed():
			cam_right_down = true
		elif event.is_action("camera_right") and not event.is_pressed():
			cam_right_down = false
			
		if event.is_action("camera_left") and event.is_pressed():
			cam_left_down = true
		elif event.is_action("camera_left") and not event.is_pressed():
			cam_left_down = false
			
		if event.is_action("camera_up") and event.is_pressed():
			cam_up_down = true
		elif event.is_action("camera_up") and not event.is_pressed():
			cam_up_down = false
			
		if event.is_action("camera_down") and event.is_pressed():
			cam_down_down = true
		elif event.is_action("camera_down") and not event.is_pressed():
			cam_down_down = false


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom -= Vector2(0.1,0.1)
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom += Vector2(0.1,0.1)
			zoom = clamp(zoom, Vector2(0.4, 0.4), Vector2(1.2,1.2))
	if event is InputEventMouseMotion:
		if is_panning:
			global_position -= event.relative
