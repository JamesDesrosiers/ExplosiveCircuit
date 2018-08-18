extends Node

var popup
signal _on_destroy

func _ready():
	popup = get_node("CenterContainer/Popup")

func _on_BackButton_pressed():
	emit_signal("_on_destroy")
	self.queue_free()

func open():
	popup.show()
