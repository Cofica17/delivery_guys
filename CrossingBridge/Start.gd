extends Node

onready var start_header = get_node("MarginContainer/ColorRect/VBoxContainer/StartHeader")
onready var start_expl = get_node("MarginContainer/ColorRect/VBoxContainer/StartExpl")
onready var rules = get_node("MarginContainer/Control/HBoxContainer/Rules")
onready var play = get_node("MarginContainer/Control/HBoxContainer/Play")
onready var back = get_node("MarginContainer/Control/HBoxContainer/Back")

func _ready():
	$MarginContainer/Control/HBoxContainer/Back.connect("pressed", self, "_on_back_pressed")
	$MarginContainer/Control/HBoxContainer/Play.connect("pressed", self, "_on_play_pressed")
	$MarginContainer/Control/HBoxContainer/Rules.connect("pressed", self, "_on_rules_pressed")
	
	TextHandler.set_text(start_header)
	TextHandler.set_text(start_expl)
	TextHandler.set_text(rules)
	TextHandler.set_text(play)
	TextHandler.set_text(back)
	

func _on_back_pressed() -> void:
	get_tree().change_scene("res://ChooseGame.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Game.tscn")


func _on_rules_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Rules.tscn")
