extends Node2D
class_name chargedspeedsim


#start/reset buttons

@export var testCharge : particle
@export var target_point : Node2D
@export var init_pos : Node2D
@onready var sim_timer : Timer = $sim_timer
@onready var finish_label : Label = $finish_label

@export var text_box : TextEdit

@export var dThreshhold : float = 3		#number of pixels that the particle can be away.

#extra info!
@export var speed_label : Label 
@export var time_label : Label
@export var pos_label : Label

var timer : float = 0
var low_time : float = 0.95
var high_time : float = 1.05

var running : bool = false

func _ready() -> void:
	start()

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("confirm"):
		start()
	if event.is_action_pressed("cancel"):
		reset()
		
func _process(delta : float) -> void:
	if running:
		timer += delta 
	update_labels()

func start() -> void:
	running = true
	testCharge.moveActive = true
	sim_timer.start()
	testCharge.charge = float(text_box.text) * (1/pow(10, 4))
	print("udpated charge: ", testCharge.charge)
	print(float(testCharge.charge))

func reset() -> void:
	running = false
	testCharge.moveActive = false
	testCharge.reset()
	testCharge.global_position = init_pos.global_position
	timer = 0

func stop() -> void:
	testCharge.moveActive = false
	finish_label.visible = true
	print("simtimer out")
	check_time()
	running = false

func update_labels() -> void:
	speed_label.text = "Q2 Velocity: " + str(testCharge.vel.x)
	time_label.text = "Time Elapsed: " + str(timer)
	pos_label.text = "Distance from Start: " + str((testCharge.global_position.x - init_pos.global_position.x)/100)

func checkPosition() -> void:
	if(testCharge.global_position.distance_to(target_point.global_position)) < dThreshhold:
		finish_label.text = "You got it!"
	else:
		finish_label.text = "Hm, not quite right."

func check_time() -> void: 
	if low_time < timer && timer < high_time:
		finish_label.text = "you got it!"
	else:
		finish_label.text = "not quite..."

func _on_reset_button_button_down() -> void:
	reset()

func _on_start_button_button_down() -> void:
	start()
	finish_label.visible = false
	
func _on_sim_timer_timeout() -> void:
	pass

func _on_end_area_area_entered(area: Area2D) -> void:
	stop()
