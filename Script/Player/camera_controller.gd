extends Node3D

var camroot_h: float = 0
var camroot_v: float = 0
@export var cam_V_max: int = 75
@export var cam_v_min: int = -55
var h_sensitivity: float = 0.01
var v_sensitivity: float = 0.01
var h_acceleration: float = 10.0
var v_acceleration: float = 10.0

var is_touching: bool = false
var last_touch_position: Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			is_touching = true
			last_touch_position = event.position
		else:
			is_touching = false
	elif event is InputEventScreenDrag and is_touching:
		var delta = event.position - last_touch_position
		last_touch_position = event.position

		camroot_h += -delta.x * h_sensitivity
		camroot_v += delta.y * v_sensitivity

func _physics_process(delta: float) -> void:
	camroot_v = clamp(camroot_v, deg_to_rad(cam_v_min), deg_to_rad(cam_V_max))
	get_node("h").rotation.y = lerpf(get_node("h").rotation.y, camroot_h, delta * h_acceleration)
	get_node("h/v").rotation.x = lerpf(get_node("h/v").rotation.x, camroot_v, delta * v_acceleration)
