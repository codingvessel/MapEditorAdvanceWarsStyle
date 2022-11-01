extends Node

signal show_tile_info(tile_data, mouse_position)
signal edited_map_changed(loaded_map)

var current_tile_coordinates = Vector2i(0,0)
var can_place = false
