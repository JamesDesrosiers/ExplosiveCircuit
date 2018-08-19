extends Node2D

func _on_Bomb_explosion():
	$ColorRect.visible = true
	$Tween.interpolate_property($"ColorRect", "color", Color(0,0,0,0), Color(0,0,0,1), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	get_tree().change_scene("res://_Scenes/TitleScreen.tscn")
