extends Node


func _ready():
	TextHandler.en = MainEnglishTranslation.en
	TextHandler.tur = MainTurkishTranslation.tur
	TextHandler.set_text($MarginContainer/ColorRect/VBoxContainer/SelectGame)
	TextHandler.set_text($MarginContainer/ColorRect/VBoxContainer/SelectLanguage)


func _on_ChooseGame_pressed():
	get_tree().change_scene("res://ChooseGame.tscn")


func _on_SelectLanguage_pressed():
	get_tree().change_scene("res://LanguageSelect.tscn")
