extends Node2D

@onready
var tilemap:TileMap = $TileMap

var buildings :Array[Vector2i]
var building_layer:int = 1

var neutral_buildings:Array[Vector2i]
var player_1_buildings:Array[Vector2i]
var player_2_buildings:Array[Vector2i]

func _ready():
	buildings = tilemap.get_used_cells(building_layer)
	collect_player_buildings()
	

func collect_player_buildings():
	for building in buildings:
		
		if(tilemap.get_cell_alternative_tile(building_layer, building, false) <= 2):
			neutral_buildings.append(building)
			
		elif(tilemap.get_cell_alternative_tile(building_layer, building, false) <= 5):
			player_1_buildings.append(building)
			
		elif(tilemap.get_cell_alternative_tile(building_layer, building, false) <= 8):
			player_2_buildings.append(building)
