extends Node

onready var back_btn = $MarginContainer/Control3/HBoxContainer/Back
onready var tryAgain_btn = $MarginContainer/Control3/HBoxContainer/TryAgain
onready var go = $MarginContainer/Control3/HBoxContainer2/GoBtn
onready var clear = $MarginContainer/Control3/HBoxContainer2/ClearSelection

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

onready var score_lbl = $MarginContainer/ColorRect/Score

onready var dustin_tex = $MarginContainer/EndGame/Dustin
onready var usain_tex = $MarginContainer/EndGame/Usain
onready var bridge_tex = $MarginContainer/EndGame/Bridge

onready var p = $MarginContainer/EndGame/VBoxContainer/P
onready var end_score = $MarginContainer/EndGame/VBoxContainer/EndScore

var selected := []
var begin := []
var end := []

var max_selected = 2

var score = 0


func _ready():
	back_btn.connect("pressed", self, "_on_back_btn_pressed")
	tryAgain_btn.connect("pressed", self, "_on_tryAgain_btn_pressed")
	
	call_deferred("_setup_pos")
	begin.append(ali)
	begin.append(asli)
	begin.append(necdet)
	begin.append(selin)
	
	TextHandler.set_text(go)
	TextHandler.set_text(clear)
	TextHandler.set_text(score_lbl, null, [score])
	TextHandler.set_text(back_btn)
	TextHandler.set_text(tryAgain_btn)


func _setup_pos() -> void:
	asli.rect_position = asli_bp.position
	asli.sp = asli_bp.position
	ali.rect_position = ali_bp.position
	ali.sp = ali_bp.position
	necdet.rect_position = necdet_bp.position
	necdet.sp = necdet_bp.position
	selin.rect_position = selin_bp.position
	selin.sp = selin_bp.position
	lamp.rect_position = lamp_bp.position


func _on_back_btn_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Start.tscn")


func _on_tryAgain_btn_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Game.tscn")


func _move_char(player, bp, ep) -> void:
	if player.sp == bp.position:
		player.rect_position = ep.position
	else:
		player.rect_position = bp.position
	player.sp = player.rect_position


func _clear_selection() -> void:
	for c in selected:
		c.unselected()
	
	selected.clear()


func _select_char(c) -> void:
	if c in begin and lamp_on_other_side():
		return
	
	if c in end and not lamp_on_other_side():
		return
	
	if c in end:
		max_selected = 1
		
		for c in selected:
			if c in begin:
				_clear_selection()
	
	if c in begin:
		max_selected = 2
		
		for c in selected:
			if c in end:
				_clear_selection()
	
	if selected.size() == max_selected and not c in selected:
		return
	
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
	if selected.size() == 0:
		return
	
	if not selected.size() <= 2 and not lamp_on_other_side():
		return
	
	if lamp_on_other_side() and not selected.size() == 1:
		return
	
	var s = 0
	var m = s
	for c in selected:
		match c.name:
			"Asli":
				s = 1
			"Ali":
				s = 2
			"Necdet":
				s = 6
			"Selin":
				s = 10
		if s > m:
			m = s
	
	score += m
	TextHandler.set_text(score_lbl, null, [score])
	
	for c in selected:
		c.unselected()
		
		if c in begin:
			begin.erase(c)
			end.append(c)
		else:
			end.erase(c)
			begin.append(c)
		
		match c.name:
			"Asli":
				call_deferred("_move_char", c, asli_bp, asli_ep)
			"Ali":
				call_deferred("_move_char", c, ali_bp, ali_ep)
			"Necdet":
				call_deferred("_move_char", c, necdet_bp, necdet_ep)
			"Selin":
				call_deferred("_move_char", c, selin_bp, selin_ep)
	
	
	if lamp_on_other_side():
		lamp.rect_position = lamp_bp.position
	else:
		lamp.rect_position = lamp_ep.position
	
	_clear_selection()
	
	check_end_game()


func check_end_game() -> void:
	if begin.size() == 0 and end.size() == 4:
		yield(get_tree().create_timer(0.5), "timeout")
		$MarginContainer/EndGame.visible = true
		tryAgain_btn.show()
		TextHandler.set_text(end_score, null, [score])
		$MarginContainer/Control3/HBoxContainer2.visible = false
		
		if score == 17:
			usain_tex.show()
			TextHandler.set_text(p, "P1")
		elif score == 18 or score == 19:
			dustin_tex.show()
			TextHandler.set_text(p, "P2")
		else:
			bridge_tex.show()
			TextHandler.set_text(p, "P3")


func lamp_on_other_side() -> bool:
	return lamp.rect_position == lamp_ep.position


func _on_ClearSelection_pressed():
	_clear_selection()
