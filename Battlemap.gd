extends Node2D



func _enter_tree():
	add_child(Global.battlemap)

func _ready():
	print(get_children())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
