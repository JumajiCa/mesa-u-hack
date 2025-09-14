extends Button

@export_file var file_path

var original_size := scale 
var rate := Vector2(1.1, 1.1) 

func _on_pressed() -> void:
	if file_path == null: 
		print("Scene doesn't exist!")
		return 
	else: 
		get_tree().change_scene_to_file(file_path)

func gr_rt(end_size: Vector2, duration: float) -> void: 
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT) 
	tween.tween_property(self, 'scale', end_size, duration) 

func _on_mouse_entered() -> void:
	gr_rt(rate, .1)


func _on_mouse_exited() -> void:
	gr_rt(original_size, .1)
