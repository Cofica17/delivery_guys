extends Node


func _ready():
	$MarginContainer/Control/HBoxContainer/Back.connect("pressed", self, "_on_back_pressed")
	$MarginContainer/Control/HBoxContainer/Play.connect("pressed", self, "_on_play_pressed")
	$MarginContainer/Control/HBoxContainer/Rules.connect("pressed", self, "_on_rules_pressed")


func _on_back_pressed() -> void:
	get_tree().change_scene("res://ChooseGame.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Game.tscn")


func _on_rules_pressed() -> void:
	get_tree().change_scene("res://CrossingBridge/Rules.tscn")
