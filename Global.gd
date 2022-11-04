extends Node

signal show_tile_info(tile_data, mouse_position)
signal edited_map_changed(loaded_map)
signal clear_tilemap
signal new_map(dimension_x, dimension_y)

var current_tile_coordinates = Vector2i(0,3)
var can_place = false
