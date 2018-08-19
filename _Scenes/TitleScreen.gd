extends Control

func _on_Startbutton_pressed():
	$ColorRect.visible = true
	$Tween.interpolate_property($"ColorRect", "color", Color(0,0,0,0), Color(0,0,0,1), 1, Tween.TRANS_QUAD, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	get_tree().change_scene("res://_Scenes/LevelOne.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
