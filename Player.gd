extends Area2D

export var velocidade = 300
var tamanho_tela
signal pontua

func _ready():
	tamanho_tela = get_viewport_rect().size
	
func _process(delta):
	var dir = Vector2()
	if Input.is_action_pressed("ui_down"):
		dir.y = velocidade
	if Input.is_action_pressed("ui_up"):
		dir.y = -velocidade
	if Input.is_action_pressed("ui_right"):
		dir.x = velocidade
	if Input.is_action_pressed("ui_left"):
		dir.x = -velocidade
	position += (dir*delta)
	
	
	if dir.length() > 0:
		if dir.y > 0:
			$Animacao.animation = "baixo"
		else:
			$Animacao.animation = "cima"
			$Animacao.play()
	else:
		$Animacao.stop()
	position.y = clamp(position.y,0,tamanho_tela.y)
	
		
func _on_Player_body_entered( body ):
	if body.name == 'LinhaChegada':
		emit_signal("pontua")
	else:
		$audio.play()
	position.x = 640
	position.y = 690
