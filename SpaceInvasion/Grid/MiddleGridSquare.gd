extends Node
tool

export var hide_left := false setget set_hide_left
export var hide_up := false setget set_hide_up
export var hide_right := false setget set_hide_right
export var hide_down := false setget set_hide_down


func set_hide_left(flag) -> void:
	$Left.visible = !flag
	hide_left = flag


func set_hide_right(flag) -> void:
	$Right.visible = !flag
	hide_right = flag

func set_hide_up(flag) -> void:
	$Up.visible = !flag
	hide_up = flag


func set_hide_down(flag) -> void:
	$Down.visible = !flag
	hide_down = flag
