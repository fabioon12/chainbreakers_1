extends CanvasLayer

func _ready() -> void:
	get_node("Container").hide()
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		get_node("Container").visible = get_tree().paused
		match get_tree().paused:
			true:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			false:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_inventory_button_pressed() -> void:
	get_node("Container/VBoxContainer/inventory_button").disabled = true
	get_node("Container/VBoxContainer/profile_button").disabled = false
	get_node("Container/inventory").show()
	get_node("Container/profile").hide()
func _on_profile_button_pressed() -> void:
	get_node("Container/VBoxContainer/inventory_button").disabled = false
	get_node("Container/VBoxContainer/profile_button").disabled = true
	get_node("Container/inventory").hide()
	get_node("Container/profile").show()
