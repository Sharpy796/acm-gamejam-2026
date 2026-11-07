extends Node

var level1Minigames: Array[String] = ["transitions/brewcoffee","transitions/lift","transitions/dress","transitions/type","transitions/gamble"]
var currentMinigame : int = 0
var currentSpeed : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func resetRun():
	currentMinigame = 0
	currentSpeed = 1

func getTimerAdjustment():
	return (6-currentSpeed)/5.0 # TODO: 6/5 or 5/4?

func shuffleMinigames():
	print(currentSpeed)
	level1Minigames.shuffle()
	currentMinigame = 0

func incrementMinigame() -> int:
	currentMinigame += 1
	if currentMinigame >= level1Minigames.size():
		return 1
	else:
		return 0

func getCurrentMinigame():
	return level1Minigames[currentMinigame]

func incrementFaster():
	currentSpeed += 1
	if currentSpeed > 4: # you win!
		get_tree().change_scene_to_file("res://scenes/levelselect.tscn")
	else:
		shuffleMinigames()
		get_tree().change_scene_to_file("res://scenes/transitions/faster.tscn")

func transitionOutOfMinigame():
	if incrementMinigame() != 0:
		incrementFaster()
	else:
		get_tree().change_scene_to_file("res://scenes/transitions/countdown.tscn")
