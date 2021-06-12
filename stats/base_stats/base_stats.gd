extends Node

class_name BaseStats ,"res://editor/icons/stats.svg"

signal base_stats_updated
signal level_up


export var level : int
export var max_level : int


export var max_hp : int
export var matk : int
export var def : int
export var mdef : int
export var hit : int
export var eva : int
export var aspd : int
export var cspd : int


func level_up():
	emit_signal("level_up")
	
func base_stats_updated():
	emit_signal("base_stats_updated")
	
func update_base_stats():
	pass
