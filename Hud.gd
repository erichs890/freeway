extends CanvasLayer

signal reinicia




func _on_menu_pressed():
	get_tree().change_scene("res://menu.tscn")


func _on_Button_pressed():
	emit_signal("reinicia")
