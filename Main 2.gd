extends Node

const CENA_CARROS = preload("res://Carros.tscn")
var pistas_lentas = [160, 216, 324, 384, 438, 544, 600]
var pistas_rapidas = [104,272,488]
var score = 0
var score2 = 0
func _ready():
	$AudioTema.play()
	$Hud2/Mensagem1.text = ""
	$Hud2/Mensagem2.text = ""
	$Hud2/Button1.hide()
	$Hud2/botao.hide()
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
	if score>=5: 
		$AudioTema.stop()
		$AudioVitoria.play()
		$TimerCarrosLentos.stop()
		$TimerCarrosRapidos.stop()
		$Hud2/Mensagem1.text = "Player 1 Ganhou!"
		$Hud2/Button1.show()
		$Player.hide()
		$Player.hide()
		$Hud2/botao.show()
	else:
		$Hud2/Placar1.text = str(score)
		$AudioPonto.play()

func _on_Player2_pontua2():
	score2+=1
	if score2>=5:
		$AudioTema.stop()
		$AudioVitoria.play()
		$TimerCarrosLentos.stop()
		$TimerCarrosRapidos.stop()
		$Hud2/Mensagem2.text = "Player 2 Ganhou!"
		$Hud2/Button1.visible = true
		$Player2.hide()
		$Player.hide()
		$Hud2/botao.show()
	else:
		$Hud2/Placar2.text = str(score2)
		$AudioPonto.play()


func _on_Hud2_reinicia():
	score2= 0
	score= 0
	$Player2.position.x = 759
	$Player2.position.y = 683
	$Player.position.x = 438
	$Player.position.y = 683
	$AudioTema.play()
	$TimerCarrosRapidos.start()
	$TimerCarrosLentos.start()
	$Hud2/Mensagem1.text = ""
	$Hud2/Mensagem2.text = ""
	$Hud2/Placar1.text = "0"
	$Hud2/Placar2.text = "0"
	$Hud2/Button1.hide()
	$Player.show()
	$Player2.show()
	$Hud2/botao.hide()

