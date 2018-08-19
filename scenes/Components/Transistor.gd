extends Node2D

export(int) var CONTROL_VOLT = 5

var volt = 0

var leftConnect
var rightConnect
var topConnect

func _ready():
	pass

func _process(delta):
	update_volt()

func _on_Left_area_entered(area):
	leftConnect = area.get_parent()

func _on_Right_area_entered(area):
	rightConnect = area.get_parent()

func _on_Top_area_entered(area):
	topConnect = area.get_parent()

func update_volt():
	if(topConnect != null and topConnect.has_method("get_volt") and topConnect.get_volt(self) > CONTROL_VOLT):
		volt = 0
		return
	
	var volt_left
	var volt_right
	
	if(leftConnect != null and leftConnect.has_method("get_volt")):
		volt_left = leftConnect.get_volt(self)
	else: volt_left = 0
	if(rightConnect != null and rightConnect.has_method("get_volt")):
		volt_right = rightConnect.get_volt(self)
	else: volt_right = 0
	if(volt_left > volt_right):
		volt = volt_left
	else:
		volt = volt_right

func get_volt(who):
	if(who != topConnect):
		return volt
	else:
		return null
