extends Node2D

export(int) var POWER = 60

var active = false

func _ready():
	$Timer.start()
	pass


func _on_Timer_timeout():
	active = true

func get_volt(who):
	if(active): return POWER
	else: return 0

func is_source():
	return active
