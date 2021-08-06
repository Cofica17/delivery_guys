extends Node


func _on_English_pressed():
	TextHandler.language = "en"
	get_tree().change_scene("res://start.tscn")


func _on_Turkish_pressed():
	TextHandler.language = "tur"
	get_tree().change_scene("res://start.tscn")
