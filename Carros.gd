extends RigidBody2D

func _ready():
	var tipos_carros =["carro01","carro02","carro03","carro04","carro05","carro06","carro07","carro08","carro09","carro10","carro11","carro12","carro13","carro14"]
	var carro = tipos_carros[randi() % tipos_carros.size()]
	$Animacao.animation = carro


func _on_Notificador_screen_exited():
	queue_free()
