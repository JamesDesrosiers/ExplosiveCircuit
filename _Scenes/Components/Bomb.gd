extends Node2D

export(int) var THRESHOLD = 100

var leftConnect
var rightConnect

var volt = 0
signal explosion

func _ready():
	_process(0)

func _process(delta):
	update_volt()

func is_source():
	return false

func update_volt():
	var volt_left
	var volt_right
	
	if(leftConnect != null  and leftConnect.has_method("get_volt")):
		volt_left = leftConnect.get_volt(self)
	else: volt_left = 0
	if(rightConnect != null and rightConnect.has_method("get_volt")):
		volt_right = rightConnect.get_volt(self)
	else: volt_right = 0
	
	if(volt_left >= volt_right):
		volt = volt_left
	elif(volt_right > volt_left):
		volt = volt_right
	else:
		volt = 0
	
	if(volt >= THRESHOLD):
		boom()

func get_volt(who):
	return volt

func _on_Left_area_entered(area):
	leftConnect = area.get_parent()

func _on_Right_area_entered(area):
	rightConnect = area.get_parent()

func boom():
	emit_signal("explosion")
	self.queue_free()