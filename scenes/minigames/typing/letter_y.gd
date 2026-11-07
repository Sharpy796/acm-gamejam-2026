extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed_scale = 1.0/Globals.getTimerAdjustment()
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
