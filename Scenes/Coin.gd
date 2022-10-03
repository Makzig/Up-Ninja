extends Mob_Object

func _on_Coin_area_entered(area):
	if area.is_in_group("Player"):
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)
		$AudioStreamPlayer2D.play()
		Global.score += 1
		Global.coins += 1
		Global.this_score += 1
		Global.hardering()
	if area.is_in_group("Damage_area"):
		queue_free()


func _on_AudioStreamPlayer2D_finished():
	queue_free()
