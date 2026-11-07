extends AnimatedSprite2D

@onready var timer: Timer = get_node("Timer")
var countdown = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countdown = 3
	timer.wait_time = 0.5*Globals.getTimerAdjustment()
	timer.one_shot = false
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	countdown -= 1
	if countdown < 0:
		get_tree().change_scene_to_file("res://scenes/%s.tscn" % Globals.getCurrentMinigame())
	else:
		frame = countdown
