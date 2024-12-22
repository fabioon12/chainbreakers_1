extends Control


func _on_mainkan_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")


func _on_keluar_pressed() -> void:
	get_tree().quit()


func _on_tentang_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tentang.tscn")
