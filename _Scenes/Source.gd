extends Node2D

export(int) var volt = 120

func _ready():
	pass
func get_volt():
	return volt
func is_source():
	return true