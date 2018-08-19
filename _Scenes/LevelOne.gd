extends Node2D

export(int) var LENGTH

var time

func _ready():
	time = Timer.new()
	time.wait_time = LENGTH
	time.one_shot = true
	time.connect("timeout", self, "_on_Timeout")
	self.add_child(time)
	time.start()

func _on_Bomb_explosion():
	$ColorRect.visible = true
	$Tween.interpolate_property($"ColorRect", "color", Color(0,0,0,0), Color(0,0,0,1), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	get_tree().change_scene("res://_Scenes/TitleScreen.tscn")

func _on_Timeout():
	get_node("Instructions/CenterContainer/RichTextLabel").text = "BOMB DIFUSED. TRANSITIONING TO NEXT BOMB"
	OS.delay_msec(100)
	next_level()

func next_level():
	$ColorRect.visible = true
	$Tween.interpolate_property($"ColorRect", "color", Color(0,0,0,0), Color(0,0,0,1), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	get_tree().change_scene("res://_Scenes/LevelTwo.tscn")