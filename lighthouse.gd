@tool
extends StaticBody3D

@onready var light_pivot: Node3D = $LightPivot
@onready var detection_area: Area3D = %DetectionArea

var dragged = false
var rotated = false

@export var rotation_speed = 0 # degress per second

@export var type: Globals.LighthouseType = Globals.LighthouseType.ATTRACT:
	set(new_type):
		type = new_type
		update_color()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func update_color():
	var color
	match type:
		Globals.LighthouseType.REPEL:
			color = Color(0.8, 0.12, 0.154, 0.502)
		Globals.LighthouseType.TURN_PORT_SIDE:
			color = Color(1, 0.2, 0.2, 0.5)
		Globals.LighthouseType.TURN_STARBOARD_SIDE:
			color = Color(0.285, 0.38, 0.119, 0.502)
		_:
			color = Color(1.0, 1.0, 0.192, 0.502)

	var material = StandardMaterial3D.new()
	material.albedo_color = color
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	$LightPivot/LightCone.set_surface_override_material(0, material)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	
	if Input.is_action_just_released("click"):
		if dragged:
			$Drop.play()
		dragged = false
		rotated = false
		$Ray.stop()
	if dragged:
		global_position = Vector3(Globals.mouse_pos.x, global_position.y, Globals.mouse_pos.z)
	if rotated:
		var prev = light_pivot.rotation.y
		light_pivot.look_at(Vector3(Globals.mouse_pos.x, light_pivot.global_position.y, Globals.mouse_pos.z))
		if light_pivot.rotation.y == prev:
			$Ray.stop()
		else:
			if not $Ray.playing:
				$Ray.play()
			

	if get_tree().paused:
		return
	
	light_pivot.rotate_y(deg_to_rad(rotation_speed) * delta)
	
	if detection_area.get_overlapping_bodies():
		for boat in detection_area.get_overlapping_bodies():
			boat.steer(self, delta, type)

func _on_lighthouse_input(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if not "state" in get_tree().get_current_scene():
		return
	var state = get_tree().get_current_scene().state
	if state != Globals.GameState.SETUP:
		return
	if event.is_action_pressed("click"):
		dragged = true
		report_drag()
		$Pick.play()

func report_drag():
	get_tree().get_current_scene().report_drag()

func _on_light_input(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		rotated = true
		$Ray.play()
