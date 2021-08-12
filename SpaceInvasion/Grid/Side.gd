extends ColorRect

signal pressed

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			emit_signal("pressed")
