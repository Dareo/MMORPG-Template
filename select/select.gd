extends Area


func select():
	pass
	
func unselect():
	pass
	
	

func _on_Select_mouse_entered():
	$Indicator.visible = true


func _on_Select_mouse_exited():
	$Indicator.visible = false
