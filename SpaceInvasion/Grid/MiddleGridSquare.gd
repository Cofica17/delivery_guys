extends Control
tool

export var hide_left := false setget set_hide_left
export var hide_up := false setget set_hide_up
export var hide_right := false setget set_hide_right
export var hide_down := false setget set_hide_down

var draw_left = false
var draw_up = false
var draw_right = false
var draw_down = false

func _process(delta):
	update()


func show_dotted_line(_name) -> void:
	match _name:
		"Left":
			draw_left = true
		"Right":
			draw_right = true
		"Up":
			draw_up = true
		"Down":
			draw_down = true


func _draw():
	if draw_left:
		draw_dashed_line(Vector2(5, 5), Vector2(5, 100), Color.black, 2, 5, false)
		
	if draw_up:
		draw_dashed_line(Vector2(10, 5), Vector2(100, 5), Color.black, 2, 5, false)
		
	if draw_right:
		draw_dashed_line(Vector2(115, 5), Vector2(115, 100), Color.black, 2, 5, false)
	
	if draw_down:
		draw_dashed_line(Vector2(10, 105), Vector2(100, 105), Color.black, 2, 5, false)


func draw_dashed_line(from, to, color, width, dash_length = 5, cap_end = false, antialiased = false):
	var length = (to - from).length()
	var normal = (to - from).normalized()
	var dash_step = normal * dash_length
	
	if length < dash_length: #not long enough to dash
		draw_line(from, to, color, width, antialiased)
		return

	else:
		var draw_flag = true
		var segment_start = from
		var steps = length/dash_length
		for start_length in range(0, steps + 1):
			var segment_end = segment_start + dash_step
			if draw_flag:
				draw_line(segment_start, segment_end, color, width, antialiased)

			segment_start = segment_end
			draw_flag = !draw_flag
		
		if cap_end:
			draw_line(segment_start, to, color, width, antialiased)


func show_texture(turn):
	if turn == 1:
		$Texture.texture = load("res://SpaceInvasion/assets/Alien.jpg")
	
	$Texture.visible = true

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
