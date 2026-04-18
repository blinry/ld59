extends CharacterBody3D

@export var speed: float = 3 
@export_range(0.0,0.5) var rotation_speed: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = transform.basis.z * speed
	move_and_slide()
	
func attract(attractor, delta):
	var target_angle =  global_position.direction_to(attractor.global_position).signed_angle_to(transform.basis.z,Vector3.DOWN)
	var target_angle_deg = rad_to_deg(target_angle)
	#rotate_y(deg_to_rad(max_rotation_speed*delta))
	rotation.y = lerp_angle(rotation.y, rotation.y + target_angle, rotation_speed)
