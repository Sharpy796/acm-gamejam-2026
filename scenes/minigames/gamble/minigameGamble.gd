extends AnimatedSprite2D

signal minigame_completed
@onready var timer: Timer = get_node("Timer")
var random = RandomNumberGenerator.new()
var completed = false
var progress = 0
var clicking = false
var hovering = false
var GOAL = 500

func succeed():
	frame = 3 # happy sprite
	timer.wait_time = 1.5*Globals.getTimerAdjustment()
	timer.one_shot = true
	timer.start()
	minigame_completed.emit()
	completed = true

func _input(event):
	if not completed:
		if event is InputEventMouseButton:
			print("Clicked!")
			clicking = event.pressed
		if event is InputEventMouseMotion and clicking and hovering:
			progress += event.relative.length()/2
			move_local_x(random.randi_range(-5,5))
			rotate(random.randf_range(-0.03,0.03))
			if progress >= GOAL*2.0/3.0:
				frame = 2
			elif progress >= GOAL/3.0:
				frame = 1
			print(progress)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	completed = false
	progress = 0
	clicking = false
	hovering = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if progress >= GOAL and not completed:
		completed = true
		succeed()


func _on_area_2d_mouse_entered() -> void:
	hovering = true


func _on_area_2d_mouse_exited() -> void:
	hovering = false


func _on_timer_timeout() -> void:
	Globals.transitionOutOfMinigame()
