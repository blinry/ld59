extends CharacterBody3D

@export var speed: float = 10
@export_range(0.0,0.5) var rotation_speed: float = 0.005

var crashed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if crashed:
		global_position.y -= 0.1 * delta
		if global_position.y < -5:
			queue_free()

	velocity = -transform.basis.z * speed
	var collision = move_and_slide()
	if collision:
		explode()

func steer(attractor, delta, repel):
	var target_angle =  global_position.direction_to(attractor.global_position).signed_angle_to(transform.basis.z,Vector3.DOWN)
	if !repel:
		target_angle += PI
	#rotate_y(deg_to_rad(max_rotation_speed*delta))
	rotation.y = lerp_angle(rotation.y, rotation.y + target_angle, rotation_speed)

func arrive():
	Globals.score += 1
	queue_free()

func explode():
	if not crashed:
		print("boom!")
		speed = 0
		var black = StandardMaterial3D.new()
		black.albedo_color = Color(0, 0, 0)
		black.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		black.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		$Body.set_surface_override_material(0, black)
		$Front.set_surface_override_material(0, black)
		crashed = true
