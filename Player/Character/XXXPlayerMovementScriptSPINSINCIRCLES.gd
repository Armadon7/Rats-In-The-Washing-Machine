extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var Rotation_Speed = 3
var Rotation_Target = 0
var Rotation_Add_Amount = deg_to_rad(1.0) 


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#ORIGIANAL CODE# var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var Player_Look_Direction = Vector2(velocity.z*.05, velocity.x*.05)
	#var Player_Turning_Left = Rotation_Target-- Rotation_Add_Amount
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if velocity.length() > .02:
		self.rotation.y = Player_Look_Direction.angle()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
