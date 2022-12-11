extends Label


func _ready():
	text = "Day : 1"
	Global.next_turn.connect(update_label)

func update_label(player, day):
	text = "Day : " + str(day)
