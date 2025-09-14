extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var screen_size


func _ready() -> void:
	screen_size = get_viewport_rect().size
	



func _physics_process(delta: float) -> void:
	#print(position)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#print(velocity.length())
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if velocity.length() > 2000:
		position = Vector2(73.0, 609.9815)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
