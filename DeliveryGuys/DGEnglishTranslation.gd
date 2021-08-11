extends Node
class_name DGEnglishTranslation

const en := {
	"StartHeader" : "Delivery Guys",
	"StartExpl" : """Two friends, who work for the same cargo company bet on this: \"Who delivers the most shipment in a single day?\"
	
	Each worker in this company starts his/her day with a truck. Each truck is given 9 districts.

	   District/Packages
A			 1
B			 2
C 			3
D 			4
E 			5
F 			6
G 			7
H 			8
I 			9

The ambition is to deliver the most number of packages in a single day.""",
	"Rules":"Rules",
	"Play":"Play",
	"RulesHeader" : "HOW TO PLAY",
	"RulesExpl" : """
	• Each player takes turns and throws a couple of dice.
	• Add the numbers on dice. E.g. the dice show 6 and 5, which makes 11 in total. That means the player can eliminate numbers that add up to 11:
    6+5(eliminate 6 and 5)
    2+3+6(eliminate 2,3 and 6)
    1+2+3+5 (eliminate 1,2,3 and 6)
et cetera.
	• A number can be eliminated only once.
	• A player's turn ends when his/her throw is useless: E.g. the throw gives 1 and 2, a total of 3. This means only possibilities are 1+2 or only 3. Let's say 2 and 3 are eliminated already. That means the player can not make any move, hence the turn ends.
	• The player who eliminated the most number of packages is the winner.""",
	"Back" : "Back",
	"Confirm" : "Send Packages",
	"Clear" : "Clear selection",
	"TryAgain" : "Try again",
	"Roll" : "Roll",
	"RollDicesFirst" : "You need to roll the dices first!",
	"PackagesDelivered" : "You delivered %d packages so far, next roll!",
	"SumToLow" : "Sum selected is too low!",
	"SumToHigh" : "Sum selected is too high!",
	"GameOverText" : """You cannot eliminate anymore numbers, the game is over

Your score is %d""",
"LanguageSelect" : "Select language",
"P1" : "You really want to ride your bicycle!",
"P2" : "Harley cannot keep up with you!",
"P3" : "The road is yours!",
"P4" : "Nothing less than an 18-wheeler!",
"P5" : "Are you the Flying Dutchman?!",
"PackagesArrived" : "Packages arrived"
}
