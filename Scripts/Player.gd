extends KinematicBody2D
class_name Player

enum{
	IDLE,
	DASH,
	WALK,
	JUMP,
	DIE,
	AFTER_DIE,
}

var state = IDLE

var movement_velocity:Vector2 = Vector2.ZERO
var direction = 1 


# warning-ignore:unused_signal
signal killing

func flip():
	match direction:
		1:
			$Sprite.flip_h = false
		-1:
			$Sprite.flip_h = true


func set_state(this_state):
	state = this_state
	
	match state:
		AFTER_DIE:
			pass
		DIE:
			kill()
		WALK:
			pass
		JUMP:
			jumping()
		DASH:
			dash()


func movement(delta):
	var MOVE_SPEED:float = 100.0
	var GRAVITY = 670
	
	if is_on_wall():
		direction *= -1
		flip()
	movement_velocity.x = MOVE_SPEED * direction 
	movement_velocity.y += GRAVITY * delta

func jumping():
	var JUMP_VELOCITY = 250
	movement_velocity.y = -JUMP_VELOCITY
	$AnimationPlayer.play("Jump")

func _input(event):
	if state != DIE and state != AFTER_DIE:
		if state == WALK:
			if event.is_action_pressed("dash"):
				set_state(DASH)
		if state == WALK or state == JUMP:
			if event is InputEventScreenTouch:
				set_state(JUMP)
				
	if event is InputEventScreenDrag:
		if state == WALK or state == JUMP:
			if event.relative.x > 10:
				direction = 1
				flip()
				set_state(DASH)
			elif event.relative.x < -10: 
				direction = -1
				flip()
				set_state(DASH)
			



func dash():
	state = DASH
	var dash_velocity = 200
	
	movement_velocity.y = 0
	movement_velocity.x = 0
	movement_velocity.x += dash_velocity * direction
	$AnimationPlayer.play("Dash")

func _physics_process(delta):
	if state != DASH and state != IDLE and state != DIE:
		movement(delta)
	movement_velocity = move_and_slide(movement_velocity)


func _on_HeartBox_area_entered(area):
	if area.is_in_group("Enemy"):
		set_state(DIE)


func kill():
	movement_velocity = Vector2.ZERO
	$AnimationPlayer.play("Dead")


func reset_state():
	state = WALK

func _on_CanvasLayer_start_game():
	set_state(WALK)
