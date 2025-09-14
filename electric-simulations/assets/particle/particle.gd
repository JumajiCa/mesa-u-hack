extends Node2D
class_name particle

@export var vel : Vector2 = Vector2(0,0)
var acc : Vector2 = Vector2(0,0)
var test_vel : float = 0
@export var charge : float = 1.0 * (1/pow(10, 4))
@export var mass : float = 1.0
@export var efield : float = 1.0 * pow(10, 4)

@export var moveActive : bool = false

@export var otherCharge : particle

const K : int = 8.99 * pow(10, 9)
#8.99 * 10^9

#the particle should move the current velocity * the delta every frame,
#and also the vel should be modulated by the acceleration, which will be
#calculated by its position related to the other particle

var timer : float = 0

func _process(delta : float) -> void:
	if !moveActive:
		return
	timer += delta
	accelerate(delta)
	move(delta)
	
func accelerate(d : float) -> void:
	vel.x = timer * (charge*efield)/mass
	acc.x = clampf((charge*efield)/mass, -99999999, 999999999)
	print("acceleration+ delta", acc.x, ":", d)

	vel += Vector2(clampf(acc.x*d, -999999, 999999), clampf(acc.y, -999999, 999999))
	#print("test_vel", test_vel)
	#print("velocity: ", vel.x)
	
	# F = kqq/(r^2)
func move(delta : float) -> void:
	global_position += vel * delta * 100
	#100 is meters to pixels

func reset() -> void:
	vel = Vector2(0,0)
	timer = 0
