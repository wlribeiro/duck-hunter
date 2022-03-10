extends KinematicBody2D

var lado = 1
var vewl = Vector2()
var speed = 100
var queda = 1


func _ready():
	randomize()
	$movimento.wait_time = rand_range(0.4, 2)
	$animation.wait_time = rand_range(0.6, 1)
	

func _process(delta):
	# movimentação horizontal
	position.x += speed * lado * delta
	
	# movimentação vertical
	position.y -= 140 * queda * delta
	
	# espelhamento da aniação
	if lado < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		


func _on_movimento_timeout():
	lado = lado * (-1)


func _on_animation_timeout():
	if $AnimatedSprite.animation == "cima":
		$AnimatedSprite.animation = "lado"
	elif $AnimatedSprite.animation == "lado":
		$AnimatedSprite.animation = "cima"

func mata():
	$AnimatedSprite.animation = "susto"
	$morte.start()

func _on_morte_timeout():
	$AnimatedSprite.animation = "morte"
	queda = -1
	lado = 0
