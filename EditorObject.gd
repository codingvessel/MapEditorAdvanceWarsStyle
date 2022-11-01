extends Node2D


@onready
var level = get_node("/root/MapEditor/Level")

@onready
var tile_map : TileMap = level.get_node("TileMap")

var current_item
var mouse_position


func _process(delta):
	global_position = get_global_mouse_position()
	mouse_position = tile_map.local_to_map(get_global_mouse_position())

	show_tile_info()
	if Global.can_place:
		if Input.is_action_pressed("left_click"):
			place_tile()
		if Input.is_action_pressed("right_click"):
			remove_tile()
	
	
func show_tile_info():
	if (tile_map.get_cell_source_id(0, Vector2i(mouse_position.x, mouse_position.y)) == -1):
		return
		
		
	var tile_data = tile_map.get_cell_tile_data(0, Vector2i(mouse_position.x, mouse_position.y))
	if tile_data != null:
		Global.emit_signal("show_tile_info", tile_data, mouse_position)

func place_tile():
	if mouse_position.x < 0 or mouse_position.x > 30 or mouse_position.y < 0 or mouse_position.y > 30:
		return
	tile_map.set_cell(0, Vector2i(mouse_position.x, mouse_position.y),0, Global.current_tile_coordinates)

func remove_tile():
	var mousepos = tile_map.local_to_map(get_global_mouse_position())
	tile_map.set_cell(0,  Vector2i(mousepos.x, mousepos.y),-1, Vector2i(-1, -1), -1)
