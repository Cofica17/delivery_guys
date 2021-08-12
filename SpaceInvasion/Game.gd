extends Node

var grid := []

var s1 := []
var s2 := []
var s3 := []
var s4 := []
var s5 := []
var s6 := []
var s7 := []
var s8 := []
var s9 := []

var human_score:int = 0
var alien_score :int = 0

onready var h_score = $MarginContainer/ColorRect/Score/HBoxContainer/HumanScore
onready var a_score = $MarginContainer/ColorRect/Score/HBoxContainer/AlienScore
onready var current_turn = $MarginContainer/ColorRect/Score/CurrentTurn
onready var p = $MarginContainer/ColorRect/Score/P
onready var alien_invade_sound = $AlienInvadeSound
onready var human_invade_sound = $HumanInvadeSound
onready var human_defeat = $HumanDefeatSound
onready var alien_defeat = $AlienDefeatSound

enum Turn {Human, Alien}

var turn
var end_game = false

func _ready():
	_fill_squares()
	_connect_sides_to_signal()
	turn = Turn.Human
	TextHandler.set_text(current_turn, "CurrentTurnHuman")
	TextHandler.set_text(h_score, null, [human_score])
	TextHandler.set_text(a_score, null, [alien_score])
	TextHandler.set_text($MarginContainer/Control3/HBoxContainer/Back)
	TextHandler.set_text($MarginContainer/Control3/HBoxContainer/TryAgain)


func end_turn() -> void:
	if turn == Turn.Human:
		turn = Turn.Alien
		TextHandler.set_text(current_turn, "CurrentTurnAlien")
	else:
		turn = Turn.Human
		TextHandler.set_text(current_turn, "CurrentTurnHuman")


func _on_side_pressed(side) -> void:
	side.visible = false
	var score = _check_if_square_conqured()
	
	if turn == Turn.Human:
		human_invade_sound.play()
	else:
		alien_invade_sound.play()
	
	if not score == 0:
		
		if turn == Turn.Human:
			human_score += score
		else:
			alien_score += score
			alien_invade_sound.play()
		
		TextHandler.set_text(h_score, null, [human_score])
		TextHandler.set_text(a_score, null, [alien_score])
		
		_is_end_game()
	
	end_turn()


func _is_end_game():
	if human_score + alien_score == 9:
		end_game = true
		TextHandler.set_text(p, "P%d" % [human_score+1])
		$MarginContainer/Control3/HBoxContainer/TryAgain.visible = true
		current_turn.hide()
		
		if human_score > alien_score:
			alien_defeat.play()
		else:
			human_defeat.play()


func _check_if_square_conqured():
	var score = 0
	var _grid = grid.duplicate()
	
	for square in _grid:
		var conqured = true
		
		for side in square:
			if side.visible:
				conqured = false
				
		if conqured:
			score += 1
			_show_middle_tex(square[0])
			grid.erase(square)
		
		
	return score


func _show_middle_tex(side) -> void:
	if side in s1:
		$MarginContainer/ColorRect/Grid/GridUp/Square1.show_texture(turn)
	elif side in s2:
		$MarginContainer/ColorRect/Grid/GridUp/Square2.show_texture(turn)
	elif side in s3:
		$MarginContainer/ColorRect/Grid/GridUp/Square3.show_texture(turn)
	elif side in s4:
		$MarginContainer/ColorRect/Grid/GridMiddle/Square1.show_texture(turn)
	elif side in s5:
		$MarginContainer/ColorRect/Grid/GridMiddle/Square2.show_texture(turn)
	elif side in s6:
		$MarginContainer/ColorRect/Grid/GridMiddle/Square3.show_texture(turn)
	elif side in s7:
		$MarginContainer/ColorRect/Grid/GridDown/Square1.show_texture(turn)
	elif side in s8:
		$MarginContainer/ColorRect/Grid/GridDown/Square2.show_texture(turn)
	elif side in s9:
		$MarginContainer/ColorRect/Grid/GridDown/Square3.show_texture(turn)


func _connect_sides_to_signal() -> void:
	for square in grid:
		for side in square:
			side.connect("pressed", self, "_on_side_pressed", [side])


func _on_Back_pressed():
	get_tree().change_scene("res://SpaceInvasion/Start.tscn")


func _fill_squares() -> void:
	s1.append($MarginContainer/ColorRect/Grid/GridUp/Square1/Right)
	s1.append($MarginContainer/ColorRect/Grid/GridUp/Square1/Up)
	s1.append($MarginContainer/ColorRect/Grid/GridUp/Square1/Down)
	s1.append($MarginContainer/ColorRect/Grid/GridUp/Square1/Left)
	
	s2.append($MarginContainer/ColorRect/Grid/GridUp/Square2/Down)
	s2.append($MarginContainer/ColorRect/Grid/GridUp/Square2/Up)
	s2.append($MarginContainer/ColorRect/Grid/GridUp/Square1/Right)
	s2.append($MarginContainer/ColorRect/Grid/GridUp/Square3/Left)
	
	s3.append($MarginContainer/ColorRect/Grid/GridUp/Square3/Right)
	s3.append($MarginContainer/ColorRect/Grid/GridUp/Square3/Up)
	s3.append($MarginContainer/ColorRect/Grid/GridUp/Square3/Down)
	s3.append($MarginContainer/ColorRect/Grid/GridUp/Square3/Left)
	
	s4.append($MarginContainer/ColorRect/Grid/GridMiddle/Square1/Left)
	s4.append($MarginContainer/ColorRect/Grid/GridMiddle/Square1/Right)
	s4.append($MarginContainer/ColorRect/Grid/GridUp/Square1/Down)
	s4.append($MarginContainer/ColorRect/Grid/GridDown/Square1/Up)
	
	s5.append($MarginContainer/ColorRect/Grid/GridMiddle/Square2/Right)
	s5.append($MarginContainer/ColorRect/Grid/GridMiddle/Square1/Right)
	s5.append($MarginContainer/ColorRect/Grid/GridUp/Square2/Down)
	s5.append($MarginContainer/ColorRect/Grid/GridDown/Square2/Up)
	
	s6.append($MarginContainer/ColorRect/Grid/GridMiddle/Square3/Right)
	s6.append($MarginContainer/ColorRect/Grid/GridMiddle/Square2/Right)
	s6.append($MarginContainer/ColorRect/Grid/GridUp/Square3/Down)
	s6.append($MarginContainer/ColorRect/Grid/GridDown/Square3/Up)

	s7.append($MarginContainer/ColorRect/Grid/GridDown/Square1/Right)
	s7.append($MarginContainer/ColorRect/Grid/GridDown/Square1/Up)
	s7.append($MarginContainer/ColorRect/Grid/GridDown/Square1/Down)
	s7.append($MarginContainer/ColorRect/Grid/GridDown/Square1/Left)
	
	s8.append($MarginContainer/ColorRect/Grid/GridDown/Square2/Down)
	s8.append($MarginContainer/ColorRect/Grid/GridDown/Square2/Up)
	s8.append($MarginContainer/ColorRect/Grid/GridDown/Square1/Right)
	s8.append($MarginContainer/ColorRect/Grid/GridDown/Square3/Left)
	
	s9.append($MarginContainer/ColorRect/Grid/GridDown/Square3/Right)
	s9.append($MarginContainer/ColorRect/Grid/GridDown/Square3/Up)
	s9.append($MarginContainer/ColorRect/Grid/GridDown/Square3/Down)
	s9.append($MarginContainer/ColorRect/Grid/GridDown/Square3/Left)
	
	grid.append(s1)
	grid.append(s2)
	grid.append(s3)
	grid.append(s4)
	grid.append(s5)
	grid.append(s6)
	grid.append(s7)
	grid.append(s8)
	grid.append(s9)


func _on_TryAgain_pressed():
	get_tree().change_scene("res://SpaceInvasion/Game.tscn")
