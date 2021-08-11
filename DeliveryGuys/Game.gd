extends Node

onready var dice1:Sprite = get_node("MarginContainer/Control2/HBoxContainer/Dice1")
onready var dice2:Sprite = get_node("MarginContainer/Control2/HBoxContainer/Dice2")
onready var error = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/DicesNotRolled")
onready var btn1 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn1")
onready var btn2 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn2")
onready var btn3 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn3")
onready var btn4 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn4")
onready var btn5 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn5")
onready var btn6 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn6")
onready var btn7 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn7")
onready var btn8 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn8")
onready var btn9 = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer2/HBoxContainer/btn9")
onready var confirm_btn = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer/Confirm")
onready var clear_btn = get_node("MarginContainer/Control/VBoxContainer/VBoxContainer/Clear")
onready var game = get_node("MarginContainer")
onready var end = get_node("MarginContainer2")
onready var roll = get_node("MarginContainer/Control2/HBoxContainer/Roll")
onready var try_again = get_node("MarginContainer/Control3/HBoxContainer/TryAgain")
onready var back = get_node("MarginContainer/Control3/HBoxContainer/Back")
onready var end_text = get_node("MarginContainer2/Control/VBoxContainer/GameOverText")
onready var end_tex = get_node("MarginContainer2/Control/Texture")

var tx1 = load("res://assets/want to ride my bicycle.jpg")
var tx2 = load("res://assets/harley cant keep up.png")
var tx3 = load("res://assets/road is yours.png")
var tx4 = load("res://assets/nothing less than an 18 wheeler.jpg")
var tx5 = load("res://assets/flying dutchman.jpg")

var tempElapsed = 0
var diced = false
var rolled = false
var dice_num = 0
var dice_num2 = 0
var diceTime = 0
var diceMovement = 0
var rng = RandomNumberGenerator.new()
var dice_1_result:int = 0
var dice_2_result:int = 0

var total := 0
var btns_to_disable:Array = []
var packages_total := 0
var not_eliminated_numbers : Array = [1,2,3,4,5,6,7,8,9]
var not_eliminated_numbers_temp : Array = []

func _ready():
	rng.randomize()
	btn1.connect("pressed", self, "_on_btn_pressed", [1, btn1])
	btn2.connect("pressed", self, "_on_btn_pressed", [2, btn2])
	btn3.connect("pressed", self, "_on_btn_pressed", [3, btn3])
	btn4.connect("pressed", self, "_on_btn_pressed", [4, btn4])
	btn5.connect("pressed", self, "_on_btn_pressed", [5, btn5])
	btn6.connect("pressed", self, "_on_btn_pressed", [6, btn6])
	btn7.connect("pressed", self, "_on_btn_pressed", [7, btn7])
	btn8.connect("pressed", self, "_on_btn_pressed", [8, btn8])
	btn9.connect("pressed", self, "_on_btn_pressed", [9, btn9])
	TextHandler.set_text(confirm_btn)
	TextHandler.set_text(clear_btn)
	TextHandler.set_text(roll)
	TextHandler.set_text(try_again)
	TextHandler.set_text(back)


func _on_btn_pressed(value:int, btn:Button) -> void:
	if not rolled:
		error.show()
		TextHandler.set_text(error, "RollDicesFirst")
		return
	
	total += value
	not_eliminated_numbers_temp.append(value)
	btn.disabled = true
	btns_to_disable.append(btn)


func _on_Confirm_pressed():
	var dice_total = dice_1_result + dice_2_result
	
	if total == dice_total:
		error.show()
		packages_total += total
		TextHandler.set_text(error, "PackagesDelivered", [packages_total])
		
		if packages_total >= 0 and packages_total <= 10:
			TextHandler.append_text(error, "P1", true)
		elif packages_total >= 11 and packages_total <= 20:
			TextHandler.append_text(error, "P2", true)
		elif packages_total >= 21 and packages_total <= 30:
			TextHandler.append_text(error, "P3", true)
		elif packages_total >= 31 and packages_total <= 40:
			TextHandler.append_text(error, "P4", true)
		elif packages_total >= 41 and packages_total <= 45:
			TextHandler.append_text(error, "P5", true)
		
		btns_to_disable.clear()
		confirm_btn.disabled = true
		clear_btn.disabled = true
		rolled = false
		roll.disabled = false
		for num in not_eliminated_numbers_temp:
			not_eliminated_numbers.erase(num)
		TextHandler.set_text(roll)
		
		if packages_total == 45:
			game_over()
		
		
	elif total < dice_total:
		error.show()
		TextHandler.set_text(error, "SumToLow")
	elif total > dice_total:
		error.show()
		TextHandler.set_text(error, "SumToHigh")


func _on_Clear_pressed():
	for btn in btns_to_disable:
		btn.disabled = false
	error.text = ""
	not_eliminated_numbers_temp.clear()
	btns_to_disable.clear()
	total = 0


func _process(delta):
	tempElapsed = tempElapsed + delta
	
	if diced:
		if tempElapsed < diceTime:
			diceMovement = diceMovement + delta
			if diceMovement >= 0.03:
				dice1.frame = randi() % 6
				dice2.frame = randi() % 6
				diceMovement = 0
		else:
			diced = false
			dice1.frame = dice_num
			dice2.frame = dice_num2
			handleDice()


func handleDice():
	rolled = true
	dice_1_result = dice1.frame + 1
	dice_2_result = dice2.frame + 1
	
	if not can_eliminate_numbers():
		game_over()


func game_over() -> void:
	yield(get_tree().create_timer(1.0), "timeout")
	#game.hide()
	end.show()
	TextHandler.set_text(end_text, null, [packages_total])
	try_again.show()
	
	if packages_total >= 0 and packages_total <= 10:
		end_tex.texture = tx1
		TextHandler.set_text(error, "P1")
	elif packages_total >= 11 and packages_total <= 20:
		end_tex.texture = tx2
		TextHandler.set_text(error, "P2")
	elif packages_total >= 21 and packages_total <= 30:
		end_tex.texture = tx3
		TextHandler.set_text(error, "P3")
	elif packages_total >= 31 and packages_total <= 40:
		end_tex.texture = tx4
		TextHandler.set_text(error, "P4")
	elif packages_total >= 41 and packages_total <= 45:
		end_tex.texture = tx5
		TextHandler.set_text(error, "P5")


func can_eliminate_numbers() -> bool:
	var can_eliminate = false
	var dice_total = dice_1_result + dice_2_result
	
	if not_eliminated_numbers.size() == 0:
		return false
	
	for i in not_eliminated_numbers:
		if i == dice_total:
			return true
		elif not_eliminated_numbers.size() > 1:
			for j in not_eliminated_numbers:
				if i == j:
					continue
				if i + j == dice_total or j ==  dice_total:
					return true
				elif not_eliminated_numbers.size() > 2:
					for k in not_eliminated_numbers:
						if k == j or k == i:
							continue
						if i + j + k == dice_total or k ==  dice_total:
							return true
						elif not_eliminated_numbers.size() > 3:
							for g in not_eliminated_numbers:
								if g == i or g == j or g == k:
									continue
								if i + j + k + g == dice_total or g ==  dice_total:
									return true
	return false


func dice():
	if diced:
		return
	
	dice_num = rng.randi_range(0, 5)
	dice_num2 = rng.randi_range(0, 5)
	dice1.frame = dice_num
	dice2.frame = dice_num2
	diced = true
	tempElapsed = 0
	diceMovement = 0
	
	randomize()
	var diceType = randi() % 4
	if diceType == 0:
		diceTime = 0.3
		
	if diceType == 1:
		diceTime = 0.1

	if diceType == 2:
		diceTime = 0.5

	if diceType == 3:
		diceTime = 0.2


func _on_Roll_pressed():
	dice()
	error.text = ""
	roll.disabled = true
	total = 0
	confirm_btn.disabled = false
	clear_btn.disabled = false
	TextHandler.set_text(roll, "PackagesArrived")


func _on_TryAgain_pressed():
	get_tree().change_scene("res://DeliveryGuys/Game.tscn")


func _on_Back_pressed():
	get_tree().change_scene("res://DeliveryGuys/start.tscn")
