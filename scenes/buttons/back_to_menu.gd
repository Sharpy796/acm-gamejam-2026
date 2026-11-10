extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")


func _on_area_2d_mouse_entered() -> void:
	modulate.r = .7
	modulate.g = .7
	modulate.b = .7
	print("done")

func _on_area_2d_mouse_exited() -> void:
	modulate.r = 1
	modulate.g = 1
	modulate.b = 1
	print("noty done")
