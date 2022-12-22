extends Node2D

@onready
var player_money_label = $CanvasLayer/Player1GUI/VBoxContainer/MoneyLabel

var level

var player_1_money = 0
var player_2_money = 0

var neutral_buildings:Array[Vector2i]
var player_1_buildings:Array[Vector2i]
var player_2_buildings:Array[Vector2i]

var player_1_units:Array[Vector2i]
var player_2_units:Array[Vector2i]

enum TURNS {
	RED, BLUE
}

var current_turn = TURNS.RED
var day = 1


func _enter_tree():
	add_child(Global.battlemap)

func _ready():
	Global.next_turn.connect(on_next_turn_start)
	initialize_map()
	process_income(TURNS.keys()[current_turn])
	update_ui()
	
func initialize_map():
	level = get_node("Level")
	neutral_buildings = level.neutral_buildings
	player_1_buildings = level.player_1_buildings
	player_2_buildings = level.player_2_buildings
	
func process_income(player):
	if player == 'RED':
		for building in player_1_buildings:
			player_1_money += 1000
	if player == 'BLUE':
		for building in player_2_buildings:
			player_2_money += 1500
	
func update_ui():
	var player_money = 0 
	if current_turn == TURNS.RED:
		player_money = player_1_money
	else:
		player_money = player_2_money
	player_money_label.text = "Money: " + str(player_money)

func _on_end_turn_button_pressed():
	if current_turn == TURNS.RED:
		current_turn = TURNS.BLUE
	else:
		current_turn = TURNS.RED
		day += 1
	Global.emit_signal("next_turn", TURNS.keys()[current_turn], day)


func on_next_turn_start(player, day):
	process_income(player)
	update_ui()
	
