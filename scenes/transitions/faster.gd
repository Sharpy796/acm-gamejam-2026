extends AnimatedSprite2D

@onready var timer: Timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = Globals.currentSpeed-2
	timer.wait_time = 2
	timer.one_shot = true
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/transitions/countdown.tscn")
	
