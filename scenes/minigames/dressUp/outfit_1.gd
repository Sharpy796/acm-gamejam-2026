extends Sprite2D
const SPEED:int = 50

var hovering = false
var clicking = false
var dragging = false

func _on_area_2d_mouse_entered():
	hovering = not clicking
func _on_area_2d_mouse_exited():
	hovering = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		clicking = event.pressed
	if event is InputEventMouseMotion and clicking and hovering:
		dragging = true


func _process(delta):
	if dragging or (hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		global_position = get_global_mouse_position()
		dragging = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
		hovering = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)


func _on_animated_sprite_2d_found_1() -> void:
	hide()
