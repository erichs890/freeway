extends Node

const CENA_CARROS = preload("res://Carros.tscn")
var pistas_lentas = [160, 216, 324, 384, 438, 544, 600]
var pistas_rapidas = [104,272,488]
var score = 0
func _ready():
	$AudioTema.play()
	$Hud/Mensagem.text = ""
	$Hud/Button.hide()
	$Hud/menu.hide()
	randomize()

func _on_TimerCarrosRapidos_timeout():
	var novo_carro = CENA_CARROS.instance()
	add_child(novo_carro)
	var pista = pistas_rapidas[randi() % pistas_rapidas.size()]
	novo_carro.position = Vector2(-10,pista)
	novo_carro.linear_velocity.x = rand_range(700,710)


func _on_TimerCarrosLentos_timeout():
	var novo_carro = CENA_CARROS.instance()
	add_child(novo_carro)
	var pista = pistas_lentas[randi() % pistas_lentas.size()]
	novo_carro.position = Vector2(-10,pista)
	novo_carro.linear_velocity.x = rand_range(300,310)


func _on_Player_pontua():
	score+=1
	if score>=10: 
		$AudioTema.stop()
		$AudioVitoria.play()
		$TimerCarrosLentos.stop()
		$TimerCarrosRapidos.stop()
		$Hud/Mensagem.text = "Player Ganhou!"
		$Hud/Button.show()
		$Player.hide()
		$Hud/menu.show()
		
	else:
			$Hud/Placar.text = str(score)
			$AudioPonto.play()

func _on_Hud_reinicia():
	score= 0
	$Player.position.x = 640
	$Player.position.y = 690
	$AudioTema.play()
	$TimerCarrosRapidos.start()
	$TimerCarrosLentos.start()
	$Hud/Mensagem.text = ""
	$Hud/Placar.text = "0"
	$Hud/menu.hide()
	$Player.show()
	$Hud/Button.hide()
	
