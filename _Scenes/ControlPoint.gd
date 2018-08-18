extends Node2D

export(int) var HIGH = 120

const MENU = preload("res://_Scenes/RadialMenu.tscn") 
var menu

var leftConnect
var rightConnect

var volt = 0
var state = State.free

enum State{
	free,
	high,
	low
	}


func _ready():
	pass

func _process(delta):
	update_volt()

func is_source():
	return state == State.high

func update_volt():
	
	var volt_left
	var volt_right
	
	if(leftConnect != null and leftConnect.has_method("get_volt")):
		volt_left = leftConnect.get_volt()
	else: volt_left = 0
	if(rightConnect != null and rightConnect.has_method("get_volt")):
		volt_right = rightConnect.get_volt()
	else: volt_right = 0
	
	if(state == State.free):
		if(volt_right > 120 or volt_left > 120):
			self.queue_free()
		elif(volt_left > volt_right):
			volt = volt_left
		else:
			volt = volt_right
	elif(state == State.high):
		volt = HIGH
	else:
		volt = 0

func get_volt():
	return volt

func _on_Left_area_entered(area):
	leftConnect = area.get_parent()

func _on_Right_area_entered(area):
	rightConnect = area.get_parent()


func _on_TextureButton_pressed():
	if(menu != null): return
	
	menu = MENU.instance()
	menu.connect("_on_destroy", self, "_menu_callback")
	get_node("CenterContainer").add_child(menu)
	
	menu.open()

func _menu_callback():
	menu = null