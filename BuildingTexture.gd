extends TextureRect

@onready
var submenu_buildings = $SubMenuBuildings

@export
var tile_type = Global.TileType.GRASS


func _on_gui_input(event):
	item_clicked(event)
	
	
func item_clicked(event):
	if event is InputEvent:
		if event.is_action_pressed("left_click"):
			submenu_buildings.visible = !submenu_buildings.visible

func _on_selected_tile_changed(new_selected_tile):
	submenu_buildings.visible = false
	texture = new_selected_tile.texture
	tile_type = new_selected_tile.tile_type
	Global.current_tile_coordinates = Global.tile_to_atlas_coordinates.get(tile_type)
