extends Button


func _on_button_down():
	Global.emit_signal("clear_tilemap")
