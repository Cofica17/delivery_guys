extends ColorRect

signal pressed


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			emit_signal("pressed")

func show_dotted_line() -> void:
	get_parent().show_dotted_line(name)
