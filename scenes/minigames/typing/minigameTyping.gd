extends AnimatedSprite2D

signal minigame_completed
@onready var timer: Timer = get_node("Timer")
var progress = 0
var letters: Array[String] = ["M","O","N","E","Y"]
var completed = false

func succeed():
	frame = 1 # happy sprite
	timer.wait_time = 1.5*Globals.getTimerAdjustment()
	timer.one_shot = true
	timer.start()
	minigame_completed.emit()
	completed = true

func _input(event):
	if event is InputEventKey and event.pressed and not completed:
		if event.as_text() == letters[progress]:
			progress += 1
			get_node(event.as_text()).modulate.a = .6
			if progress >= letters.size():
				succeed()
		else:
			progress = 0
			for letter in letters:
				get_node(letter).modulate.a = 1.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 0
	progress = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	Globals.transitionOutOfMinigame()
