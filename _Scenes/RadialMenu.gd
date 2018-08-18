extends Control

var popup
signal _on_destroy
signal _on_high
signal _on_low

enum STATE{
	free,
	high,
	low
	}

func _ready():
	popup = get_node("CenterContainer/Popup")

func update(state):
	if(state == STATE.high):
		get_node("CenterContainer/Popup/HighButton").disabled = true
		get_node("CenterContainer/Popup/LowButton").disabled = false
	elif(state == STATE.low):
		get_node("CenterContainer/Popup/LowButton").disabled = true
		get_node("CenterContainer/Popup/HighButton").disabled = false
	return

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

func _on_HighButton_pressed():
	emit_signal("_on_high")

func _on_LowButton_pressed():
	emit_signal("_on_low")
