extends CanvasLayer


enum{
	MAIN,
	PRESTART
	IN_GAME,
}

var state = MAIN

signal start_game

func _process(_delta):
	$PreStart/Score.text = str(Global.score)

func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _input(event):
	if event is InputEventScreenTouch and state == PRESTART:
		emit_signal("start_game")
		state = IN_GAME
		$AnimationPlayer.play("Hide_preStart")

func _on_Start_pressed():
	$AnimationPlayer.play("Hide_main")

func set_state(this_state):
	state = this_state


func _on_Player_killing():
	$GameOver/AnimationPlayer.play("GameOver")
	if Global.max_score <= Global.score:
		Global.max_score = Global.score
	$GameOver/TextureRect/OverScore.text = str("Your score: ", Global.score, "\n", "Max score: ", Global.max_score)
