extends Node

class_name Equipment

signal wepon_changed
signal body_changed
signal additional_changed
signal assessories_changed
signal special_equipment_changed


var weapon
var body
var additional
var accessories
var special_equipment

func set_weapon(var weapon : Weapon):
	emit_signal("wepon_changed")


func set_body(var body : Body):
	emit_signal("body_changed")


func set_additional_gear(var additional_gear : AdditionalGear):
	emit_signal("additional_changed")


func set_accessories(var assessories : Accessory):
	emit_signal("assessories_changed")


func set_special_equipment(var special_equipment : SpecialEquipment):
	emit_signal("special_equipment_changed")


