extends Button

@onready
var level = get_node("/root/Main/Level")

@onready
var tile_map : TileMap = level.get_node("TileMap")


func _on_button_down():
	tile_map.owner = level
	var packed_scene = PackedScene.new()
	packed_scene.pack(level)
	ResourceSaver.save(packed_scene, "res://my_saved_scene.tscn", 0)
