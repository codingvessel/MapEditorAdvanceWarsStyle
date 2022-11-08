extends TextureRect

@onready
var submenu_tiles = $SubMenuTiles

@onready
var submenu_buildings = $"../BuildingTexture/SubMenuBuildings"

@export
var tile_type = Global.TileType.GRASS


func _ready():
	Global.selected_tile_changed.connect(_on_selected_tile_changed)


func _on_gui_input(event):
	item_clicked(event)
	
	
func item_clicked(event):
	if event is InputEvent:
		if event.is_action_pressed("left_click"):
			submenu_tiles.visible = !submenu_tiles.visible
			submenu_buildings.visible = false
			Global.place_mode = Global.CursorModes.TILE

func _on_selected_tile_changed(new_selected_tile):
	submenu_tiles.visible = false
	texture = new_selected_tile.texture
	tile_type = new_selected_tile.tile_type
	Global.current_tile_coordinates = Global.tile_to_atlas_coordinates.get(tile_type)
