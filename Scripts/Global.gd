extends Node



var max_score = 0
var score = 0
var this_score = 0
var hard_level = 0
var coins = 0

func hardering():
	if this_score >= 25:
		this_score = 0
		hard_level += 1
