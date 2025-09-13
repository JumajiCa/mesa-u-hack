extends Control


func _on_start_pressed() -> void:
	print(get_tree_string()) 

func _on_quit_pressed() -> void:
	get_tree().quit() 
