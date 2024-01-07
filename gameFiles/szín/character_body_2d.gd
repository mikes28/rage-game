
extends CharacterBody2D
#var time_passed: float = 0

const SPEED = 300.0 / 2
const friction: float = 0
const acceleration: float = .95
var jump_direction: int = 0
var space_time:float = 0

#config basically
const jump_velocity_x = 1200.0 / 1.5
const jump_velocity_y = -600.0 / 1.5
const space_speed = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	#does not work, should be animation, but idk how the IDE works still :/
	if abs(velocity.x)>1:
		$Sprite.animation="running"
	else:
		$Sprite.animation="default"
	
	#MOVEMENT
	if direction !=0:
		jump_direction=direction # "W 0:00:00:0256   Narrowing conversion (float is converted to int and loses precision)." - :nerd:, it should be 1 or -1 stfu

	if is_on_floor():
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = velocity.x * friction # = 0 //caz friction is 0. we could set it to a non-0 value so it is more annoying
			
		if Input.is_action_pressed("move_up"):
			velocity.x = 0
			space_time += delta * space_speed
			print(abs(sin(space_time)))
		elif Input.is_action_just_released("move_up"):
				velocity.x = jump_direction * jump_velocity_x * abs(sin(space_time))
				velocity.y = jump_velocity_y * abs(cos(space_time))
				space_time = 0
	else:
		#velocity.x = velocity.x * acceleration # this is commented so that while jumping ur arc is perfect
		velocity.y += gravity * delta #gravity here is acceleration, just like irl no way.
			

	move_and_slide()
	
	#time_passed += delta
	#print(time_passed)
