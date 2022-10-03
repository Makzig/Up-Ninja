extends Area2D
class_name Mob_Object


var movement_velocity:Vector2 = Vector2.ZERO
var move_speed:float = 200.0


func _ready():
	move_speed = 200.0

func _physics_process(delta):
	movement_velocity.y = move_speed + (Global.hard_level * 20)
	global_position += movement_velocity * delta

