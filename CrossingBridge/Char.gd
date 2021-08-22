extends Control

var current_y = -7
var tw:Tween

var sp


func start_tween():
	var tween = Tween.new()
	tween.name = "Tween"
	add_child(tween)    
	tw = tween
	tween.connect("tween_completed", self, "on_tween_completed")
	$Tween.interpolate_property(self, "rect_position", rect_position, rect_position + Vector2(0, current_y), 0.25)
	$Tween.start()


func on_tween_completed(object, key):
	current_y *= -1
	start_tween()


func selected() -> void:
	start_tween()


func unselected() -> void:
	remove_child($Tween)
	rect_position = sp
