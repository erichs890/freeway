extends Area2D

export var velocidade = 300
var tamanho_tela
signal pontua2

func _ready():
	tamanho_tela = get_viewport_rect().size
	
func _process(delta):
	var dir = Vector2()
	if Input.is_action_pressed("desce"):
		dir.y = velocidade
	if Input.is_action_pressed("sobe"):
		dir.y = -velocidade
	if Input.is_action_pressed("direita"):
		dir.x = velocidade
	if Input.is_action_pressed("esquerda"):
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
	
func _on_Player2_body_entered(body):
	if body.name == 'LinhaChegada':
		emit_signal("pontua2")
	else:
		$audio.play()
	position.x = 759
	position.y = 683

