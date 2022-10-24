extends GridContainer



func _on_mouse_entered():
	Global.can_place = false


func _on_mouse_exited():
	Global.can_place = true
