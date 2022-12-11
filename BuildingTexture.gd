extends TextureRect

@onready
var submenu_buildings = $SubMenuBuildings

@onready
var submenu_tiles = $"../TileTexture/SubMenuTiles"


func _ready():
	Global.selected_building_changed.connect(_on_selected_building_changed)

func _on_gui_input(event):
	item_clicked(event)
	
	
func item_clicked(event):
	if event is InputEvent:
		if event.is_action_pressed("left_click"):
			submenu_buildings.visible = !submenu_buildings.visible
			submenu_tiles.visible = false
			Global.place_mode = Global.CursorModes.BUILDING

func _on_selected_building_changed(building):
	submenu_buildings.visible = false
	texture = building.texture
	self_modulate = building.modulate
	Global.current_building = building.building_type
