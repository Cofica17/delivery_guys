extends Node


func _ready():
	TextHandler.en = MainEnglishTranslation.en
	TextHandler.tur = MainTurkishTranslation.tur
	TextHandler.set_text($MarginContainer/ColorRect/VBoxContainer/DeliveryGuys)
	TextHandler.set_text($MarginContainer/ColorRect/VBoxContainer/AlienInvasion)
	TextHandler.set_text($Control3/HBoxContainer/Back)


func _on_DeliveryGuys_pressed():
	TextHandler.en = DGEnglishTranslation.en
	TextHandler.tur = DGTurkishTranslation.tur
	Global.current_game = Global.games.delivery_guys
	get_tree().change_scene("res://common/Start.tscn")


func _on_AlienInvasion_pressed():
	Global.current_game = Global.games.space_invasion
	TextHandler.en = SIEng.en
	TextHandler.tur = SITur.tur
	get_tree().change_scene("res://SpaceInvasion/Start.tscn")


func _on_Back_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_CrossingBridge_pressed():
	get_tree().change_scene("res://CrossingBridge/Start.tscn")
