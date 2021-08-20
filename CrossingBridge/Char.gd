extends Control

var current_y = -7
var tw:Tween

var sp

func _enter_tree():
	var tween = Tween.new()
	tween.name = "Tween"
	add_child(tween)    
	tw = tween
	tween.connect("tween_completed", self, "on_tween_completed")


func _ready():
	sp = rect_position


func start_tween():
	$Tween.interpolate_property(self, "rect_position", rect_position, rect_position + Vector2(0, current_y), 0.25)
	$Tween.start()


func on_tween_completed(object, key):
	current_y *= -1
	start_tween()


func selected() -> void:
	start_tween()


func unselected() -> void:
	tw.stop(self)
	rect_position = sp
