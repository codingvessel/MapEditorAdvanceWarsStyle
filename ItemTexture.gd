extends TextureRect

@export
var tile_atlas_coordinates := Vector2i(0,0)

func _ready():
	self.gui_input.connect(item_clicked)


func item_clicked(event):
	if event is InputEvent:
		if event.is_action_pressed("left_click"):
			Global.current_tile_coordinates = tile_atlas_coordinates
