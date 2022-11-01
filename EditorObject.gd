extends Node2D


@onready
var level = get_node("/root/MapEditor/Level")

@onready
var tile_map : TileMap = level.get_node("TileMap")

var current_item
var mouse_position
var mouse_action_place_down:bool
var mouse_action_remove_down:bool

func _ready():
	Global.edited_map_changed.connect(_on_map_changed)


func _process(delta):
	global_position = get_global_mouse_position()
	mouse_position = tile_map.local_to_map(get_global_mouse_position())

	show_tile_info()
	if Global.can_place:
		if mouse_action_place_down:
			place_tile()
		if mouse_action_remove_down:
			remove_tile()
	
func _unhandled_input(event):
	
	if event.is_action("left_click") and event.is_pressed():
		mouse_action_place_down = true
	elif event.is_action("left_click") and not event.is_pressed():
		mouse_action_place_down = false
		
	if event.is_action("right_click") and event.is_pressed():
		mouse_action_remove_down = true
	elif event.is_action("right_click") and not event.is_pressed():
		mouse_action_remove_down = false



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

func _on_map_changed(new_level):
	level.queue_free()
	level = new_level
	tile_map = level.get_node("TileMap")
