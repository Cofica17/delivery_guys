extends Node

onready var rules_header = get_node("MarginContainer/ColorRect/VBoxContainer/RulesHeader")
onready var rules_expl = get_node("MarginContainer/ColorRect/VBoxContainer/RulesExpl")
onready var back = get_node("MarginContainer/Control/Back")


func _ready():
#	TextHandler.set_text(rules_header)
#	TextHandler.set_text(rules_expl)
#	TextHandler.set_text(back)
	$MarginContainer/Control/Back.connect("pressed", self, "_on_back_pressed")


func _on_back_pressed():
	get_tree().change_scene("res://CrossingBridge/Start.tscn")
