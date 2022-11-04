extends Button


@onready
var dimension_dialog = $DimensionsDialog
@onready
var x_input = $DimensionsDialog/DimensionHBox/xInput
@onready
var y_input = $DimensionsDialog/DimensionHBox/yInput

var width = 1
var height = 1

func _on_button_down():
	dimension_dialog.visible=true


func _on_confirm_button_down():
	Global.emit_signal("new_map",width, height)


func _on_cancel_button_down():
	dimension_dialog.visible=false


func _on_x_input_value_changed(value):
	width = value


func _on_y_input_value_changed(value):
	height = value
