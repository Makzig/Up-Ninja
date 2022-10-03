extends Mob_Object

func _on_Mob_area_entered(area):
	if area.is_in_group("Damage_area"):
		Global.score += 1
		Global.this_score += 1
		Global.hardering()
		queue_free()
