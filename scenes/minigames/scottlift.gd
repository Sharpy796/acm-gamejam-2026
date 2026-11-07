extends AnimatedSprite2D

signal minigame_completed
@onready var timer: Timer = get_node("Timer")
var spaceIsHeld = false
var progress = 0
var continuing = false

func _input(event):
	if event is InputEventKey and progress < 100:
		if event.keycode == KEY_SPACE:
			if event.pressed and not spaceIsHeld:
				frame = 1
				progress += 20
				timer.wait_time = .1
				timer.one_shot = true
				timer.start()
				spaceIsHeld = true
			if not event.pressed:
				spaceIsHeld = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spaceIsHeld = false
	progress = 0
	continuing = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if continuing:
		Globals.transitionOutOfMinigame()
	elif progress < 100:
		frame = 0
	else:
		frame = 2
		timer.wait_time = 1.5*Globals.getTimerAdjustment()
		timer.one_shot = true
		timer.start()
		continuing = true
		minigame_completed.emit()
