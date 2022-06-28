extends KinematicBody2D

#variables
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 400
const MAXSPEED = 250
const JUMPFORCE = 500
const ACCEL = 10
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):

	#Caps player's fall speed
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	#Caps player's move speed
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
			
	
	if Input.is_action_pressed("Right"):
		motion.x += ACCEL
	elif Input.is_action_pressed("Left"):
		motion.x -= ACCEL
	else : 
		motion.x = lerp(motion.x,0,0.1)
	
	
	if is_on_floor():	
		if Input.is_action_just_pressed("Up"):
			motion.y = -JUMPFORCE

	motion = move_and_slide(motion, UP)
