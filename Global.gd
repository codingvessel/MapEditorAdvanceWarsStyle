extends Node

signal show_tile_info(tile_data, mouse_position)
signal edited_map_changed(loaded_map)
signal clear_tilemap
signal new_map(dimension_x, dimension_y)
signal selected_tile_changed(selected_tile)

var current_tile_coordinates = Vector2i(0,3)
var current_building:int
var can_place = false

var battlemap

enum CursorModes {
	TILE,
	BUILDING
}

var place_mode = CursorModes.TILE

enum TileType {
	GRASS,
	STREET,
	STREET2,
	STREET3,
	STREET4,
	STREET5,
	STREET6,
	STREET7,
	STREET8,
	STREET9,
	STREET10,
	STREET11,
	STREET12,
	STREET13,
	FOREST,
	HILLS,
	WATER,
}

var tile_to_atlas_coordinates :Dictionary= {
		TileType.GRASS: Vector2i(4,1),
		TileType.STREET: Vector2i(0,0),
		TileType.STREET2: Vector2i(1,0),
		TileType.STREET3: Vector2i(2,0),
		TileType.STREET4: Vector2i(3,0),
		TileType.STREET5: Vector2i(4,0),
		TileType.STREET6: Vector2i(0,1),
		TileType.STREET7: Vector2i(1,1),
		TileType.STREET8: Vector2i(2,1),
		TileType.STREET9: Vector2i(3,1),
		TileType.STREET10: Vector2i(0,2),
		TileType.STREET11: Vector2i(1,2),
		TileType.STREET12: Vector2i(2,2),
		TileType.STREET13: Vector2i(3,2),
		TileType.FOREST: Vector2i(3,3),
		TileType.HILLS: Vector2i(4,2),
		TileType.WATER: Vector2i(0,3)}
