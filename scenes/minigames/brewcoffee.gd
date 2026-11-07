extends AnimatedSprite2D

@onready var timer: Timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	play()
	timer.wait_time = 1.5
	timer.one_shot = true
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/countdown.tscn")
