extends Node


onready var start_header = get_node("MarginContainer/ColorRect/VBoxContainer/StartHeader")
onready var start_expl = get_node("MarginContainer/ColorRect/VBoxContainer/StartExpl")
onready var rules = get_node("MarginContainer/Control/HBoxContainer/Rules")
onready var play = get_node("MarginContainer/Control/HBoxContainer/Play")
onready var select_lan = get_node("MarginContainer/Control/HBoxContainer/LanguageSelect")

func _ready():
	TextHandler.set_text(start_header)
	TextHandler.set_text(start_expl)
	TextHandler.set_text(rules)
	TextHandler.set_text(play)
	TextHandler.set_text(select_lan)


func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Rules_pressed():
	get_tree().change_scene("res://Rules.tscn")


func _on_LanguageSelect_pressed():
	get_tree().change_scene("res://LanguageSelect.tscn")
