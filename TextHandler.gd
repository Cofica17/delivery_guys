extends Node

var language = "en" 

var en
var tur

func set_text(node:Node, key=null, parameters:Array=[]) -> void:
	if not key:
		key = node.name
	
	var text = ""
	
	if language == "en":
		text = en[key]
	elif language == "tur":
		text = tur[key]
	
	node.text = text % parameters


func append_text(node:Node, key=null, new_line:bool=false, parameters:Array=[]) -> void:
	if not key:
		key = node.name
	
	var text = ""
	
	if new_line:
		text = "\n"
	
	if language == "en":
		text += en[key]
	elif language == "tur":
		text += tur[key]
	
	node.text += text % parameters
