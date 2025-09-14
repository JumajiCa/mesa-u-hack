extends Area2D
var answer1 = "0 m/s"
var Q1_Answered = false
var answer2 = "15.9 m/s"

func _process(delta: float) -> void:
	if $"Display Q1/accel input/LineEdit".text == answer1:
		$"Display Q1/accel/Label".text = "Correct!!!"
		await get_tree().create_timer(3).timeout
		$"Display Q1/accel input".visible = false
		$"Display Q1/accel".visible = false
		Q1_Answered = true
		$"Display Q2/accel2".visible = true
		$"Display Q2/accel input2".visible = true
		
	if $"Display Q2/accel input2/LineEdit".text == answer2 and Q1_Answered:
		$"Display Q2/accel2/Label".text = "Correct!!!"
		await get_tree().create_timer(3).timeout
		$"Display Q2/accel input2".visible = false
		$"Display Q2/accel2".visible = false
	
func _on_body_entered(_body):
	print("Question 1")
	$"Display Q1/accel".visible = true
	$"Display Q1/accel input".visible = true
	
