extends Area2D
@onready var marker_2d = $Marker2D
@onready var health_bar = $HealthBAR
@onready var damge = $damge

var damage = 0
var isHitted = false
var isHealing = false

func _ready():
	pass # Replace with function body.
func _process(delta):
	if isHitted and not isHealing:
		if health_bar.frame == 10:
			isHealing = true
		damge.frame += 1
		health_bar.frame +=1
		marker_2d.rotation = 0.5
		isHitted = false
	
	if isHealing:
		health_bar.frame -= 1
		if health_bar.frame == 0:
			isHealing = false
	
	if abs(marker_2d.rotation) > 0.1:
		marker_2d.rotation *= -0.6
	else: marker_2d.rotation = 0

func _on_body_entered(body):
	isHitted = true
	print('hitted')
