extends CanvasLayer

signal reinicia

func _on_Button_pressed():
	emit_signal("reinicia")
	


func _on_botao_pressed():
	get_tree().change_scene("res://menu.tscn")

