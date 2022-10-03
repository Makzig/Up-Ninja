extends Node2D


func _ready():
	Global.score = 0
	Global.this_score = 0
	Global.hard_level = 0
	$Walls/AnimationPlayer.set_speed_scale(1.0)
 
func _physics_process(_delta):
	$Walls/AnimationPlayer.set_speed_scale(1.0 + Global.hard_level/10.0)
	$CanvasLayer/Label2.text = str(Global.this_score)


func _on_Player_killing():
	$Walls/AnimationPlayer.stop()
