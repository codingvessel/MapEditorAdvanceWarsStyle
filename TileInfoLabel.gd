extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.show_tile_info.connect(update_label)
	var type_info = str("Tile Type: ")
	var cover_info = str("Cover Rating: ")
	var position = str("Position: ")
	text = type_info + "\n" + cover_info + "\n" + position

func update_label(tile_data:TileData, mouse_position:Vector2i):
	var type_info = str("Tile Type: ") + str(tile_data.get_custom_data("TileType"))
	var cover_info = str("Cover Rating: ") + str(tile_data.get_custom_data("Cover"))
	var position = str("Position: ") + str(mouse_position)
	text = type_info + "\n" + cover_info + "\n" + position
