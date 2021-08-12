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

func _ready():
	_fill_squares()
	_connect_sides_to_signal()


func _on_side_pressed(side) -> void:
	side.visible = false


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
	
	s5.append($MarginContainer/ColorRect/Grid/GridMiddle/Square2/Left)
	s5.append($MarginContainer/ColorRect/Grid/GridMiddle/Square2/Right)
	s5.append($MarginContainer/ColorRect/Grid/GridUp/Square2/Down)
	s5.append($MarginContainer/ColorRect/Grid/GridDown/Square2/Up)
	
	s6.append($MarginContainer/ColorRect/Grid/GridMiddle/Square3/Left)
	s6.append($MarginContainer/ColorRect/Grid/GridMiddle/Square3/Right)
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
