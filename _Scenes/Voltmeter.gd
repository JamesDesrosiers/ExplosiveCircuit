extends Node2D

var leftConnect
var rightConnect
var volt

func _ready():
	leftConnect = get_node("../Transistor")

func _process(delta):
	if(leftConnect != null and rightConnect != null):
		volt = leftConnect.get_volt(self) - rightConnect.get_volt(self)
	elif(leftConnect != null):
		volt = leftConnect.get_volt(self)
	get_node("Reading").text = str(volt) + " V"
	pass

func is_source():
	return false
