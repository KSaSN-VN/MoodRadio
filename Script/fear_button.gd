extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var is_hovering: bool = false
var is_pressed: bool = false
signal fear_button_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	animated_sprite_2d.connect("animation_finished", _on_animated_sprite_2d_animation_finished)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_hovering and is_pressed == false:
		animated_sprite_2d.play("Hover")
	elif is_pressed == true:
		animated_sprite_2d.play("Pressed")
		
	else:
		animated_sprite_2d.play("Normal")
	
func _on_mouse_entered():
	is_hovering = true
	
func _on_mouse_exited():
	is_hovering = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and is_hovering:
		is_pressed = true
		fear_button_pressed.emit()

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "Pressed":
		is_pressed = false
