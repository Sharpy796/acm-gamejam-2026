extends AnimatedSprite2D

@onready var timer: Timer = get_node("Timer")
var countdown = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 8


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	countdown -= 1
	if countdown < 0:
		get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
	else:
		frame = countdown

func _on_animated_sprite_2d_minigame_completed() -> void:
	timer.stop()
