extends Area2D
@onready var progress_bar = $ProgressBar
@onready var marker_2d = $Marker2D

var isHitted = false
var isHealing = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if isHitted and not isHealing:
		marker_2d.rotation = 0.5
		isHitted = false
		progress_bar.value -= 10
	
	if isHealing:
		progress_bar.value += 1
		if progress_bar.value == 100:
			isHealing = false
	
	if abs(marker_2d.rotation) > 0.1:
		marker_2d.rotation *= -0.6
	else: marker_2d.rotation = 0
	
	if progress_bar.value == 0:
		isHealing = true
		isHitted = false


func _on_body_entered(body):
	isHitted = true
	print('hitted')
