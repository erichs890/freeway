extends CanvasLayer

signal reinicia

func _on_Button1_pressed():
	emit_signal("reinicia")


func _on_menu_pressed():
	get_tree().change_scene("res://menu.tscn")
