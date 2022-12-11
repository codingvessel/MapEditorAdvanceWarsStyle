extends TextureRect


@export
var building_type:int

# Called when the node enters the scene tree for the first time.
func _ready():
	self.gui_input.connect(item_clicked)


func item_clicked(event):
	if event is InputEvent:
		if event.is_action_pressed("left_click"):
			Global.emit_signal("selected_building_changed", self)
