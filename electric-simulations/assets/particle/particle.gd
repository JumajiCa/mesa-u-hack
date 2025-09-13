extends Node2D
class_name particle



@export var vel : Vector2 = Vector2(0,0)
@export var charge : float = 1.0 * (1/pow(10, 4))
@export var mass : float = 1.0 * pow(10,5)

@export var moveActive : bool = false

@export var otherCharge : particle

const K : int = 8.99 * pow(10, 9)
#8.99 * 10^9

#the particle should move the current velocity * the delta every frame,
#and also the vel should be modulated by the acceleration, which will be
#calculated by its position related to the other particle

func _process(delta : float) -> void:
	if !moveActive:
		return
	accelerate()
	move()
	
func accelerate() -> void:
	var acc : Vector2 = Vector2(0,0)
	acc.x = clampf(charge*otherCharge.charge*K/mass*(global_position.x - otherCharge.global_position.x), -999, 999)
	vel += Vector2(clampf(acc.x, -999999, 999999), clampf(acc.y, -999999, 999999))
	print(acc)
	# F = kqq/(r^2)
	
func move() -> void:
	global_position += vel

func reset() -> void:
	vel = Vector2(0,0)
