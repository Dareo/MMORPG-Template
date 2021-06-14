extends Node

class_name BaseStats ,"res://editor/icons/stats.svg"

signal base_stats_updated
signal level_up


export var level : int = 1
export var max_level : int = 256


export var max_hp : int = 100
export var matk : int = 10
export var def : int = 10
export var mdef : int = 10
export var hit : int = 10
export var eva : int = 10
export var aspd : int = 10
export var cspd : int = 10

var cur_hp : int = max_hp

func level_up():
	emit_signal("level_up")
	
func base_stats_updated():
	emit_signal("base_stats_updated")
	
func update_base_stats():
	pass
