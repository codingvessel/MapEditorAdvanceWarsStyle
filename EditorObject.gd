extends Node2D


@onready
var level = get_node("/root/Main/Level")

@onready
var tile_map : TileMap = level.get_node("TileMap")

var current_item


func _process(delta):
	global_position = get_global_mouse_position()
	if Global.can_place:
		if Input.is_action_pressed("left_click"):
			place_tile()
		if Input.is_action_pressed("right_click"):
			remove_tile()
	
	


func place_tile():	
	var mousepos = tile_map.local_to_map(get_global_mouse_position())
	tile_map.set_cell(0, Vector2i(mousepos.x, mousepos.y),0, Vector2i(Global.current_tile,0))

func remove_tile():
	var mousepos = tile_map.local_to_map(get_global_mouse_position())
	tile_map.set_cell(0,  Vector2i(mousepos.x, mousepos.y),0, Vector2i(-1, -1))
