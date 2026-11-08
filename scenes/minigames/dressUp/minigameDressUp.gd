extends AnimatedSprite2D

signal minigame_completed
signal found_0
signal found_1
signal found_2
@onready var timer: Timer = get_node("Timer")
@onready var clothing: AnimatedSprite2D = get_node("Clothing")
@onready var thought: AnimatedSprite2D = get_node("Thought")
var random = RandomNumberGenerator.new()
var outfit = -1
var succeeded = false
var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	outfit = randi_range(0,2)
	thought.frame = outfit
	thought.show()
	clothing.hide()
	frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	Globals.transitionOutOfMinigame()

func succeed():
	succeeded = true
	thought.hide()
	clothing.show()
	clothing.frame = outfit
	if outfit == 1:
		frame = 3
	else:
		frame = 1
	timer.wait_time = 1.5*Globals.getTimerAdjustment()
	timer.one_shot = true
	timer.start()
	minigame_completed.emit()

func angry():
	pass # angry sprite for a moment

func _on_button_outfit_0_pressed() -> void:
	if outfit == 0:
		succeed()
	else:
		angry()


func _on_button_outfit_1_pressed() -> void:
	if outfit == 1:
		succeed()
	else:
		angry()


func _on_button_outfit_2_pressed() -> void:
	if outfit == 2:
		succeed()
	else:
		angry()


func _on_area_2d_0_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if outfit == 0 and not succeeded and not gameOver and area.name == "Area2DMatt":
		found_0.emit()
		succeed()


func _on_area_2d_1_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if outfit == 1 and not succeeded and not gameOver and area.name == "Area2DMatt":
		found_1.emit()
		succeed()


func _on_area_2d_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if outfit == 2 and not succeeded and not gameOver and area.name == "Area2DMatt":
		found_2.emit()
		succeed()


func _on_timer_game_over() -> void:
	gameOver = true
