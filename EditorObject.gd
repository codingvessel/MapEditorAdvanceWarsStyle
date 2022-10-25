extends Node2D


@onready
var level = get_node("/root/Main/Level")

@onready
var tile_map : TileMap = level.get_node("TileMap")

var current_item


func _process(delta):
	global_position = get_global_mouse_position()
#	if global_position.x > 50 * 16 or global_position.x < -(50 * 16) :
#		return
#	if global_position.y > 50 * 16 or global_position.y < -(50 * 16):
#		return
#
	if Global.can_place:
		if Input.is_action_pressed("left_click"):
			place_tile()
		if Input.is_action_pressed("right_click"):
			remove_tile()
	
	


func place_tile():	
	var mousepos = tile_map.local_to_map(get_global_mouse_position())
	print(mousepos)
	if mousepos.x < 0 or mousepos.x > 30 or mousepos.y < 0 or mousepos.y > 30:
		return
	tile_map.set_cell(0, Vector2i(mousepos.x, mousepos.y),0, Global.current_tile_coordinates)
	var tile_data = tile_map.get_cell_tile_data(0, Vector2i(mousepos.x, mousepos.y))
#	print("TileType : "  +  str(tile_data.get_custom_data("TileType")))
#	print("Cover rating: " + str(tile_data.get_custom_data("Cover")))
	

func remove_tile():
	var mousepos = tile_map.local_to_map(get_global_mouse_position())
	tile_map.set_cell(0,  Vector2i(mousepos.x, mousepos.y),-1, Vector2i(-1, -1), -1)
