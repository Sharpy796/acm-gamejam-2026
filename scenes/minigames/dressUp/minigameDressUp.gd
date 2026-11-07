extends AnimatedSprite2D

signal minigame_completed
@onready var timer: Timer = get_node("Timer")
@onready var clothing: AnimatedSprite2D = get_node("Clothing")
@onready var thought: AnimatedSprite2D = get_node("Thought")
var random = RandomNumberGenerator.new()
var outfit = -1

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
