extends StaticBody3D

@onready var light_pivot: Node3D = $LightPivot
@onready var detection_area: Area3D = %DetectionArea


var controlled = false

@export var repel = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if repel:
		var red = StandardMaterial3D.new()
		red.albedo_color = Color(1, 0.2, 0.2, 0.5)
		red.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		red.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		$LightPivot/LightCone.set_surface_override_material(0, red)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if detection_area.get_overlapping_bodies():
		for boat in detection_area.get_overlapping_bodies():
			boat.steer(self, delta, repel)
	
	if Input.is_action_just_released("click"):
		controlled = false
	if controlled:
		light_pivot.look_at(Vector3(Globals.mouse_pos.x, light_pivot.global_position.y, Globals.mouse_pos.z))

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		controlled = true
