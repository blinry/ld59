extends CharacterBody3D

@export var speed: float = 10 # meters per second
@export_range(0.0,360) var rotation_speed: float = 20 # degrees per second

var crashed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if crashed:
		global_position.y -= 1 * delta
		if global_position.y < -5:
			queue_free()

	velocity = -transform.basis.z * speed
	var collision = move_and_slide()
	if collision:
		explode()

func steer(attractor, delta, type):
	var target_angle = 0
	
	var relative_away_from_lighthouse =  global_position.direction_to(attractor.global_position).signed_angle_to(transform.basis.z,Vector3.DOWN)
	var away_from_lighthouse = relative_away_from_lighthouse + rotation.y
	
	match type:
		Globals.LighthouseType.ATTRACT:
			target_angle = away_from_lighthouse + PI
		Globals.LighthouseType.REPEL:
			target_angle = away_from_lighthouse
		Globals.LighthouseType.TURN_PORT_SIDE:
			target_angle = rotation.y + PI/2
		Globals.LighthouseType.TURN_STARBOARD_SIDE:
			target_angle = rotation.y - PI/2
	
	var current_angle = rotation.y
	var diff = wrapf(target_angle - current_angle, -PI, PI)
	var max_rotation_this_frame = delta * deg_to_rad(rotation_speed)
	var actual_turn = clamp(diff, -max_rotation_this_frame, max_rotation_this_frame)

	rotation.y += actual_turn

func arrive():
	Globals.score += 1
	LevelManager.check_win_condition()
	queue_free()

func explode():
	if not crashed:
		print("boom!")
		speed = 0
		rotate_z(PI/8)
		var black = StandardMaterial3D.new()
		black.albedo_color = Color(0.206, 0.206, 0.206, 1.0)
		black.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		black.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		$Body.set_surface_override_material(0, black)
		$Body/Front.set_surface_override_material(0, black)
		$Body/Roof.set_surface_override_material(0, black)
		crashed = true
