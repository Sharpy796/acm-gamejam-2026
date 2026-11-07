extends AnimatedSprite2D

@onready var timer: Timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 1*Globals.getTimerAdjustment()
	timer.one_shot = false
	timer.start()
	speed_scale = 1.0/Globals.getTimerAdjustment()
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/minigames/coffee/minigameCoffee.tscn")
