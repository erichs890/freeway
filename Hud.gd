extends CanvasLayer

signal reinicia

func _on_Button1_pressed():
	emit_signal("reinicia")
