extends BaseStats

class_name MonsterStats



func _take_damage():
	self.cur_hp -= 10
	print(self.name, " has taken 10 damage, hp is now", self.cur_hp)
