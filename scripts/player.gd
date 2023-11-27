extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
var gravity = 22
var _IsJumped = 2
var last_dir = 1
var speed = 400
var toAdd:int


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i =0
	gravity = 22
	var dir = Input.get_axis("move_left", "move_right")
	print(dir)
	
	
	if dir != 0:
		last_dir = dir
		
	toAdd=0
	if Input.is_action_just_pressed("jump") and _IsJumped > 0:
		_IsJumped -= 1
		velocity.y -= 550
		i=10
		
	if i:
		toAdd= last_dir*speed*i
		i-=1
		
	if is_on_floor_only():
		_IsJumped = 1
		gravity = 0
	
	if Input.is_action_pressed("shifting"):
		if not is_on_floor():
			gravity /= 2
			velocity.x = velocity.x * 0.9
		else:
			velocity = velocity * 0.7
			
	velocity.y += gravity
	velocity.x = dir*speed+toAdd
		
	
	move_and_slide()
	
		
