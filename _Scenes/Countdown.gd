extends TextureProgress

var full
var current = 0

func _ready():
	full = get_parent().get_node("Timer").wait_time
	current = 0

func _process(delta):
	full = get_parent().get_node("Timer").wait_time
	current += delta
	update_fill()
	pass

func update_fill():
	value = current/full * 100
	return