extends Node2D

var speed: float = 600


var reset_position
var left_side_boundary: int = -360

func _ready() -> void:
	reset_position = Vector2($Cave3.position)
	#print(reset_position)

func _process(delta: float) -> void:
	$Cave3.position.x -= speed * delta
	$Cave2.position.x -= speed * delta
	$Cave1.position.x -= speed * delta

	if $Cave1.position.x <= left_side_boundary:
		$Cave1.position = reset_position
	elif $Cave2.position.x <= left_side_boundary:
		$Cave2.position = reset_position
	elif $Cave3.position.x <= left_side_boundary:
		$Cave3.position = reset_position
