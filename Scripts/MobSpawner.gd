extends Path2D


var mob_or_money = [preload("res://Scenes/Mob_child.tscn"), preload("res://Scenes/Coin.tscn")]
var time = 0.75





func spawn():
	var mob = mob_or_money[int(randi() % mob_or_money.size() - 1)].instance()
	$PathFollow2D.offset = randi()
	
	add_child(mob)
	mob.position = $PathFollow2D.position
	$MobTimer.start(time)


func complication():
	pass


func _on_MobTimer_timeout():
	spawn()



func _on_Player_killing():
	$MobTimer.stop()


func _on_CanvasLayer_start_game():
	$MobTimer.start()
