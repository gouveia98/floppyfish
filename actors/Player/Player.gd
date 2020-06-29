extends Node2D

export var max_speed = 200.0;
export var acceleration = 50.0;
var speed = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var new_accel = acceleration;
	if Input.is_action_pressed("jump"):
		new_accel *= -1
	speed += new_accel*delta
	position.y += speed*delta
	speed = clamp(speed, -max_speed, max_speed)
	rotation = speed*0.7/max_speed
