extends Camera2D

@export
var speed = 10

var is_panning


func _process(delta):
	if Input.is_action_pressed("camera_right"):
		global_position.x += speed
	if Input.is_action_pressed("camera_left"):
		global_position.x -= speed
	if Input.is_action_pressed("camera_up"):
		global_position.y -= speed
	if Input.is_action_pressed("camera_down"):
		global_position.y += speed
	
	is_panning = Input.is_action_pressed("middle_click")

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
