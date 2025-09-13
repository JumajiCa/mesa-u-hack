extends Node2D
class_name chargedspeedsim


#start/reset buttons

@export var testCharge : particle
@export var target_point : Node2D
@export var init_pos : Node2D
@onready var sim_timer : Timer = $sim_timer
@onready var finish_label : Label = $finish_label

@export var dThreshhold : float = 3		#number of pixels that the particle can be away.

func _ready() -> void:
	start()

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("confirm"):
		start()
	if event.is_action_pressed("cancel"):
		reset()

func start() -> void:
	testCharge.moveActive = true
	sim_timer.start()

func reset() -> void:
	testCharge.moveActive = false
	testCharge.reset()
	testCharge.global_position = init_pos.global_position

func checkPosition() -> void:
	if(testCharge.global_position.distance_to(target_point.global_position)) < dThreshhold:
		finish_label.text = "You got it!"
	else:
		finish_label.text = "Hm, not quite right."

func _on_reset_button_button_down() -> void:
	reset()

func _on_start_button_button_down() -> void:
	start()
	finish_label.visible = false
	
func _on_sim_timer_timeout() -> void:
	testCharge.moveActive = false
	finish_label.visible = true
	checkPosition()
	print("simtimer out")
