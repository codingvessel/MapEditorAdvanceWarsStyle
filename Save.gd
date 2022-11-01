extends Button

@onready
var save_dialog = $SaveDialog

@onready
var line_edit:LineEdit = $SaveDialog/LineEdit

@onready
var notification_dialog = $NotificationDialog

@onready
var notification_dialog_label = $NotificationDialog/Label

@onready
var level = get_node("/root/MapEditor/Level")

@onready
var tile_map : TileMap = level.get_node("TileMap")



var file_name := "my_level"

func _ready():
	Global.edited_map_changed.connect(_on_map_changed)

func _on_button_down():
	save_dialog.visible = true
	line_edit.grab_focus()
	

func _on_line_edit_text_changed(new_text):
	file_name = new_text

func _on_ok_button_down():
	save_map()
	save_dialog.visible = false
	notification_dialog_label.text = "Saved the Map \n as: \n" + file_name
	notification_dialog.visible = true
	line_edit.clear()
	
func save_map():
	var format_path = "res://Maps//{my_saved_scene}.tscn"
	var actual_path = format_path.format({"my_saved_scene": file_name})
	
	tile_map.owner = level
	var packed_scene = PackedScene.new()
	packed_scene.pack(level)
	ResourceSaver.save(packed_scene, actual_path, 0)

func _on_cancel_button_down():
	line_edit.clear()
	save_dialog.visible = false

func _on_map_changed(new_level):
	level = new_level
	tile_map = level.get_node("TileMap")
