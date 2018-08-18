extends Control

var popup
signal _on_destroy

func _ready():
	popup = get_node("CenterContainer/Popup")

func _on_BackButton_pressed():
	emit_signal("_on_destroy")
	self.queue_free()

func open():
	popup.show()

func empty_margin():
	margin_left = 0
	margin_right = 0
	margin_top = 0
	margin_bottom = 0