extends CharacterBody2D
@onready var animation_player = $AnimationPlayer


func _input(delta):
	global_position = get_global_mouse_position()
	if Input.is_action_just_pressed('Ataque'):
		animation_player.play("Attack")
