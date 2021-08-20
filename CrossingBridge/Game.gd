extends Node

onready var back_btn = $MarginContainer/Control3/HBoxContainer/Back
onready var tryAgain_btn = $MarginContainer/Control3/HBoxContainer/TryAgain

onready var asli = $MarginContainer/ColorRect/Asli
onready var ali = $MarginContainer/ColorRect/Ali
onready var necdet = $MarginContainer/ColorRect/Necdet
onready var selin = $MarginContainer/ColorRect/Selin
onready var lamp = $MarginContainer/ColorRect/Lamp

onready var asli_bp = $AsliBeginPos
onready var asli_ep = $AsliEndPos

onready var ali_bp = $AliBeginPos
onready var ali_ep = $AliEndPos

onready var necdet_bp = $NectdetBeginPos
onready var necdet_ep = $NectdetEndPos

onready var selin_bp = $SelinBeginPos
onready var selin_ep = $SelinEndPos

onready var lamp_bp = $LampBeginPos
onready var lamp_ep = $LampEndPos

var selected := []

func _ready():
	back_btn.connect("pressed", self, "_on_back_btn_pressed")
	tryAgain_btn.connect("pressed", self, "_on_tryAgain_btn_pressed")
	
	_setup_pos()


func _setup_pos() -> void:
	asli.rect_position = asli_bp.position
	ali.rect_position = ali_bp.position
	necdet.rect_position = necdet_bp.position
	selin.rect_position = selin_bp.position
	lamp.rect_position = lamp_bp.position


func _on_back_btn_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Start.tscn")


func _on_tryAgain_btn_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Game.tscn")


func _move_char(player, bp, ep) -> void:
	if player.rect_position == bp.position:
		player.rect_position = ep.position
	else:
		player.rect_position = bp.position
	player.sp = player.rect_position


func _clear_selection() -> void:
	for c in selected:
		c.unselected()
	
	selected.clear()


func _select_char(c) -> void:
	if not c in selected:
		selected.append(c)
		c.selected()
	else:
		selected.erase(c)
		c.unselected()


func _position_lamp(p) -> void:
	lamp.rect_position = p.position


func _on_Asli_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		_select_char(asli)


func _on_Ali_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		_select_char(ali)


func _on_Necdet_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		_select_char(necdet)


func _on_Selin_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		_select_char(selin)


func _on_GoBtn_pressed():
	for c in selected:
		print(c.name)
		c.unselected()
		match c.name:
			"Asli":
				_move_char(c, asli_bp, asli_ep)
			"Ali":
				_move_char(c, ali_bp, ali_ep)
			"Necdet":
				_move_char(c, necdet_bp, necdet_ep)
			"Selin":
				_move_char(c, selin_bp, selin_ep)
	
	_clear_selection()


func _on_ClearSelection_pressed():
	_clear_selection()
