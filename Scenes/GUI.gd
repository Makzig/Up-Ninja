extends CanvasLayer



func _on_TextureButton_pressed():
	$AnimationPlayer.play("Hide")





func _on_Player_killing():
	$AnimationPlayer.play("Show_lose")
	$Control/TextureRect/Label2.text = str("Your score:", Global.score)
	


func _on_TextureButton2_pressed():
	get_tree().reload_current_scene()
