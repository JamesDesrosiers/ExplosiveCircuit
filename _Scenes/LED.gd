extends Node2D

export(int) var DRAIN = 35

var leftConnect
var rightConnect
var powered = 0

var volt = 0


func _ready():
	_process(0)

func _process(delta):
	var temp = powered
	update_volt()
	if temp != powered:
		update_animation()

func is_source():
	return false

func update_volt():
	var volt_left
	var volt_right
	
	if(leftConnect != null  and leftConnect.has_method("get_volt")):
		volt_left = leftConnect.get_volt()
	else: volt_left = 0
	if(rightConnect != null and rightConnect.has_method("get_volt")):
		volt_right = rightConnect.get_volt()
	else: volt_right = 0
	
	if(volt_right > 120 or volt_left > 120):
		self.queue_free()
	elif(volt_left >= volt_right and volt_left > DRAIN):
		volt = volt_left - DRAIN
		powered = 1
	elif(volt_right > volt_left and volt_right > DRAIN):
		volt = volt_right - DRAIN
		powered = 1
	else:
		volt = 0
		powered = 0

func update_animation():
	if powered == 0:
		get_node("AnimationPlayer").play("TurnOff")
	else: get_node("AnimationPlayer").play("TurnOn")

func get_volt():
	return volt

func _on_Left_area_entered(area):
	leftConnect = area.get_parent()

func _on_Right_area_entered(area):
	rightConnect = area.get_parent()
