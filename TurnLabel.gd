extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Turn: RED"
	Global.next_turn.connect(update_label)

func update_label(player, day):
	text = "Turn: " + player
