extends BaseStats

class_name stats


"""
DESCRIPTION
	Stats Script for basic stats
	----------------------------
	int
	dex
	vit
	agi
	dex
	crt
	----------------------------
	this class regulate the stats and is the interface between the base stats and normal stats and level



"""
signal stats_updated
signal stat_reset

# stats
export var STR : int = 1
export var INT : int = 1
export var VIT : int = 1
export var AGI : int = 1
export var DEX : int = 1
export var CRT : int = 1

const MAX_STAT_AMOUNT : int = 256
const MIN_STAT_AMOUNT : int = 1

# stat limit and unasigned stats
var max_stats : int = 0
var unasigned_stats : int = 0

func get_stat(var stat : String) -> int:
	var stat_return : int = 0
	match stat:
		"STR":
			stat_return = STR
			
		"INT":
			stat_return = INT
			
		"VIT":
			stat_return = VIT
			
		"AGI":
			stat_return = AGI
			
		"DEX":
			stat_return = DEX
			
		"CRT":
			stat_return = CRT
		_:
			stat_return = -1
			
	return stat_return
		
			
func set_stat(var stat : String, var amount : int) -> void:
	var stat_return : Array
	match stat:
		"STR":
			stat_return = caculate_stat_value(STR, amount)
			STR = stat_return[0]
			unasigned_stats += stat_return[1]
			
		"INT":
			stat_return = caculate_stat_value(INT, amount)
			INT = stat_return[0]
			unasigned_stats += stat_return[1]
			
		"VIT":
			stat_return = caculate_stat_value(VIT, amount)
			VIT = stat_return[0]
			unasigned_stats += stat_return[1]
		"AGI":
			stat_return = caculate_stat_value(STR, amount)
			AGI = stat_return[0]
			unasigned_stats += stat_return[1]
		"DEX":
			stat_return = caculate_stat_value(DEX, amount)
			DEX = stat_return[0]
			unasigned_stats += stat_return[1]
		"CRT":
			stat_return = caculate_stat_value(CRT, amount)
			CRT = stat_return[0]
			unasigned_stats += stat_return[1]
			
			
			
func caculate_stat_value(var prev_value : int, var added_value : int) -> Array:
	var return_amount : Array
	var new_amount : int = prev_value + added_value
	var carry_over : int
	if new_amount > MAX_STAT_AMOUNT:
		carry_over = new_amount - MAX_STAT_AMOUNT
		new_amount = MAX_STAT_AMOUNT
		
	elif new_amount < MIN_STAT_AMOUNT:
		carry_over = (-added_value + prev_value) - 1
		new_amount = MIN_STAT_AMOUNT
		
	elif new_amount < prev_value:
		carry_over = -added_value
		
	else:
		carry_over = 0
		
	return [new_amount,carry_over]
