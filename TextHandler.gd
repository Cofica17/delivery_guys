extends Node

var language = "" 

func set_text(node:Node, key=null, parameters:Array=[]) -> void:
	if not key:
		key = node.name
	
	var text = ""
	
	if language == "en":
		text = EnglishTranslation.en[key]
	elif language == "tur":
		text = TurkishTranslation.tur[key]
	
	node.text = text % parameters
