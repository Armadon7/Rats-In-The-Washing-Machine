extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var Rotation_Speed = .05
var Rotation_Direction = 0
var Rotation_Add_Amount = deg_to_rad(3.0) 


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	#Resets the direction value per delta
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	
	if input_dir.y:
		print(input_dir.y)
		velocity.x = input_dir.y * SPEED
	if input_dir.x:
		rotate(self.up_direction, input_dir.x * Rotation_Add_Amount)
	else:
		velocity.z = move_toward(velocity.z, 0, SPEED)
		

	move_and_slide()
