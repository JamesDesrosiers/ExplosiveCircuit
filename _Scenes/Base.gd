extends Node

export(int) var SHAKE = 10
export(int) var TIME = 5
var camera

func _ready():
	camera = get_node("Camera2D")

func _on_Bomb_explosion():
	screen_shake()
	$Camera2D/ColorRect.visible = true
	$Tween.interpolate_property($"Camera2D/ColorRect", "color", Color(0,0,0,0), Color(1,0,0,1), TIME, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")

func screen_shake():
	var t = 0
	while t < TIME:
		t += get_process_delta_time()
		t = min(t, TIME)
		
		var offset = Vector2(0,0)
		offset.x = rand_range(-SHAKE, SHAKE)
		offset.y = rand_range(-SHAKE, SHAKE)
		camera.set_offset(offset)
		
		yield(get_tree(), "idle_frame")
		
	get_tree().change_scene("res://_Scenes/TitleScreen.tscn")
