extends Node2D

export(int) var HIGH = 120

const MENU = preload("res://_Scenes/Components/RadialMenu.tscn") 
var menu

var leftConnect
var rightConnect

var volt = -1
var state = STATE.free

enum STATE{
	free,
	high,
	low
	}


func _ready():
	get_node("Sprite").frame = 0
	pass

func _process(delta):
	update_volt()

func is_source():
	return state == STATE.high

func update_volt():
	if(state == STATE.free):	
		var volt_left
		var volt_right
		
		if(leftConnect != null and leftConnect.has_method("get_volt") and leftConnect.get_volt(self) != null):
			volt_left = leftConnect.get_volt(self)
		else: volt_left = 0
		if(rightConnect != null and rightConnect.has_method("get_volt") and rightConnect.get_volt(self) != null):
			volt_right = rightConnect.get_volt(self)
		else: volt_right = 0
		if(volt_left > volt_right):
			volt = volt_left
		else:
			volt = volt_right
	elif(state == STATE.high):
		volt = HIGH
	elif(state == STATE.low):
		volt = 0

func get_volt(who):
	return volt

func _on_Left_area_entered(area):
	leftConnect = area.get_parent()

func _on_Right_area_entered(area):
	rightConnect = area.get_parent()


func _on_TextureButton_pressed():
	if(menu != null): return
	
	menu = MENU.instance(state)
	menu.connect("_on_destroy", self, "_menu_gone")
	menu.connect("_on_high", self, "set_high")
	menu.connect("_on_low", self, "set_low")
	
	get_node("Canvas").add_child(menu)
	get_node("Canvas").offset = Vector2(position.x-40, position.y-40)
	
	menu.update(state)
	menu.open()

func _menu_gone():
	menu = null

func set_high():
	state = STATE.high
	get_node("AnimationPlayer").play("ForceHigh")
	menu.update(state)

func set_low():
	state = STATE.low
	get_node("AnimationPlayer").play("ForceLow")
	menu.update(state)