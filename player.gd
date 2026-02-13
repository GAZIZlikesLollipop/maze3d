extends CharacterBody3D

@export var speed = 16
@export var gravity = 30

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var current = Vector3.ZERO
	# Input check
	if Input.is_action_pressed("move_forward"):
		current.z -= 1
	if Input.is_action_pressed("move_right"):
		current.x += 1
	if Input.is_action_pressed("move_left"):
		current.x -= 1
	if Input.is_action_pressed("move_back"):
		current.z += 1
	if Input.is_action_pressed("jump") && is_on_floor():
		current.y += 1
	# Direction fix
	if current != Vector3.ZERO:
		current = current.normalized()
		$Pivot.basis = Basis.looking_at(current)
		
	# Vertical move
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (gravity * delta)
	else: 
		target_velocity.y = current.y * speed
	# Ground move
	target_velocity.x = current.x * speed
	target_velocity.z = current.z * speed
	# Move
	velocity = target_velocity
	move_and_slide()
