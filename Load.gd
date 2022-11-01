extends Button

@onready
var item_list:ItemList = $LoadDialog/VBoxContainer/ItemList

@onready
var load_dialog = $LoadDialog

@onready
var level = get_node("/root/MapEditor/Level")

@onready
var map_editor = get_node("/root/MapEditor")

var map_paths : Array[String]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
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


func _on_confirm_button_down():
	load_map()
	load_dialog.visible = false
	
func load_map():
	var selected_map_name = item_list.get_item_text(item_list.get_selected_items()[0])
	var format_path = "res://Maps//{my_scene_to_load}.tscn"
	var actual_path = format_path.format({"my_scene_to_load": selected_map_name})
	var LOADED_MAP:PackedScene = load(actual_path)
	var loaded_map = LOADED_MAP.instantiate()
	Global.emit_signal("edited_map_changed", loaded_map)
	map_editor.add_child(loaded_map)


func _on_cancel_button_down():
	load_dialog.visible = false
