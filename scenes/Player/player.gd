extends CharacterBody3D

@export var fall_multiplier: float = 2.5
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_motion := Vector2.ZERO

func _physics_process(delta: float) -> void:
	handle_camera_rotation()
	if not is_on_floor():
		if velocity.y >= 0:
			velocity.y -= gravity * delta
		else:
			velocity.y -= gravity * delta * fall_multiplier

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			mouse_motion = -event.relative * 0.001

func handle_camera_rotation() -> void:
	rotate_y(mouse_motion.x)
