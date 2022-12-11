extends Node2D

@onready
var item_list = $VBoxContainer/Play/LoadDialog/ItemList
@onready
var load_dialog = $VBoxContainer/Play/LoadDialog
@onready
var map_editor = $VBoxContainer/MapEditor

var battlemap = "res://battlemap.tscn"


var map_paths : Array[String]

func _on_map_editor_pressed():
	ScreenTransition.change_scene_to_file("res://MapEditor.tscn")


func _on_play_pressed():
	map_editor.visible = false
	load_dialog.visible = true
	open_maps()


func open_maps():
	item_list.clear()
	load_dialog.visible = true
	map_paths = dir_contents("res://Maps")
	for map_path in map_paths:
		item_list.add_item(map_path.get_basename())

func dir_contents(path) -> Array[String]:
	var dir = DirAccess.open(path)
	var map_files:Array[String]
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			map_files.append(file_name)
			file_name = dir.get_next()
			
		return map_files
	else:
		print("An error occurred when trying to access the path.")
		return Array()

func _on_confirm_pressed():
	if !item_list.get_selected_items().is_empty():
		load_map()

func load_map():
	var selected_map_name = item_list.get_item_text(item_list.get_selected_items()[0])
	var format_path = "res://Maps//{my_scene_to_load}.tscn"
	var actual_path = format_path.format({"my_scene_to_load": selected_map_name})
	var LOADED_MAP:PackedScene = load(actual_path)
	var loaded_map = LOADED_MAP.instantiate()
	Global.battlemap = loaded_map
	ScreenTransition.change_scene_to_file(battlemap)


func _on_cancel_pressed():
	load_dialog.visible = false
	map_editor.visible = true
