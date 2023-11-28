extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
var gravity = 22
var _IsJumped=2
var was_last_right

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gravity=22
	var dir = Input.get_axis("move_left", "move_right")
	velocity.x = dir * 400
	
	if is_on_floor():
		_IsJumped=2
		gravity=0
	
	if Input.is_action_pressed("shifting"):
		if not is_on_floor():
			gravity/2
			velocity.x=velocity.x*0.9
		else:
			velocity=velocity*0.7
		
	if velocity.x != 0:
		was_last_right=1

	
	print(was_last_right)
		
		
	if Input.is_action_just_pressed("jump") and _IsJumped>0:
		_IsJumped-=1
		velocity.x+=100
		velocity.y-=400
			
			
	velocity.y+=gravity
	
	move_and_slide()
	
		
