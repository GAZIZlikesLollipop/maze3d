extends CharacterBody3D

@export var speed = 12
@export var gravity = 30
@export var mouse_sensetivity = 0.002
@onready var camera_pivot = $CameraPivot

var target_velocity = Vector3.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*mouse_sensetivity)
		camera_pivot.rotate_x(-event.relative.y*mouse_sensetivity)
		camera_pivot.rotation.x = clamp(camera_pivot.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	var current = Vector3.ZERO
	# Input check
	camera_pivot.transform.basis
	if Input.is_action_pressed("move_forward"):
		current += -global_transform.basis.z
	if Input.is_action_pressed("move_right"):
		current += global_transform.basis.x
	if Input.is_action_pressed("move_left"):
		current += -global_transform.basis.x
	if Input.is_action_pressed("move_back"):
		current += global_transform.basis.z
	# Direction fix
	if current != Vector3.ZERO:
		current = current.normalized()
		
	# Vertical move
	current.y = 0
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (gravity * delta)
	# Ground move
	target_velocity.x = current.x * speed
	target_velocity.z = current.z * speed
	# Move
	velocity = target_velocity
	move_and_slide()
