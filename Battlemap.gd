extends Node2D

@onready
var player_1_money_label = $CanvasLayer/Player1GUI/MoneyLabel

var level

var player_1_money = 4000
var player_2_money = 4000

var neutral_buildings:Array[Vector2i]
var player_1_buildings:Array[Vector2i]
var player_2_buildings:Array[Vector2i]

var player_1_units:Array[Vector2i]
var player_2_units:Array[Vector2i]

enum TURNS {
	RED, BLUE
}
var current_turn = TURNS.RED
var turn_number = 0


func _enter_tree():
	add_child(Global.battlemap)

func _ready():
	initialize_map()
	update_ui()
	
func initialize_map():
	level = get_node("Level")
	neutral_buildings = level.neutral_buildings
	player_1_buildings = level.player_1_buildings
	player_2_buildings = level.player_2_buildings
	
func update_ui():
	player_1_money_label.text = "Money: " + str(player_1_money)
