extends Node2D

export var MAX_SPEED = 200.0;
export var acceleration = 400.0;
var speed = 0.0;

var margin = 16;
onready var top_target = margin;
onready var bottom_target = get_viewport_rect().size.y - margin;

func _ready():
	pass

func _physics_process(delta):
	var new_accel = acceleration;
	if Input.is_action_pressed("jump"):
		new_accel *= -1
	speed += new_accel*delta
	
	var min_speed = (-(position.y - top_target)/margin)*MAX_SPEED
	min_speed = clamp(min_speed, -MAX_SPEED, MAX_SPEED);
	var max_speed = (-(position.y - bottom_target)/margin)*MAX_SPEED
	max_speed = clamp(max_speed, -MAX_SPEED, MAX_SPEED)
	speed = clamp(speed, min_speed, max_speed)
	
	position.y += speed*delta
	rotation = atan2(speed, MAX_SPEED)
