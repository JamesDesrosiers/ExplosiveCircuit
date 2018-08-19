extends Node2D

var volt = 0
var leftConnect
var rightConnect

func _ready():
	pass

func _process(delta):
	if(leftConnect == null and rightConnect == null):
		volt = 0
	else:
		if(leftConnect == null): 
			volt = rightConnect.get_volt(self)
		elif(rightConnect == null): 
			volt = leftConnect.get_volt(self)
		elif(rightConnect.get_volt(self) > leftConnect.get_volt(self)):
			volt = rightConnect.get_volt(self)
		else:
			volt = leftConnect.get_volt(self)


func get_volt(who):
	return volt

func is_source():
	return false

func _on_Left_area_entered(area):
	leftConnect = area.get_parent()

func _on_Right_area_entered(area):
	rightConnect = area.get_parent()

func remove(tar):
	if(tar == leftConnect): leftConnect = null
	if tar == rightConnect: rightConnect = null