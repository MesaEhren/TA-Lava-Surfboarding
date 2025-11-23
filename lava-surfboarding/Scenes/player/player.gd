extends CharacterBody2D

@export var speed = 100

var currently_moving: bool = false
var target = position

var float_precision = 0.01

func _ready() -> void:
	#set to the default lane, which is lane 2.
	position = $LanesFolder/Lane2.position
	#print(position)

func _input(event):
	if event.is_action_pressed("move_up"):
		pass
	if event.is_action_pressed("move_down"):
		target = $LanesFolder/Lane3.position
		currently_moving = true
	
func _physics_process(_delta):
	if currently_moving:
		velocity = position.direction_to(target) * speed
		move_and_slide()
		if abs(position.y - target.y) < float_precision:
			currently_moving = false
		
