extends AnimatedSprite2D

@onready var timer: Timer = get_node("Timer")
var rewinding = false
var first_half = false

func rewind():
	rewinding = true
	play_backwards()
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.start()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.gameovering:
		show()
		rewind()
		Globals.gameovering = false
	else:
		hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_game_over() -> void:
	if rewinding:
		hide()
		rewinding = false
	else:
		first_half = true
		timer.wait_time = 2.0
		timer.one_shot = true
		show()
		play()
		timer.start()


func _on_timer_timeout() -> void:
	if first_half:
		Globals.gameOver()
		first_half = false
	else:
		hide()
