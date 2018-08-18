extends Node2D

var leftConnect
var rightConnect
var volt

func _ready():
	leftConnect = get_node("../ControlPoint")

func _process(delta):
	if(leftConnect != null and rightConnect != null):
		volt = leftConnect.get_volt() - rightConnect.get_volt()
	elif(leftConnect != null):
		volt = leftConnect.get_volt()
	get_node("Reading").text = str(volt) + " V"
	pass

func is_source():
	return false
