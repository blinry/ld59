extends StaticBody3D

@onready var light_pivot: Node3D = $LightPivot

var controlled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		controlled = false
	if controlled:
		light_pivot.look_at(Vector3(Globals.mouse_pos.x, light_pivot.global_position.y, Globals.mouse_pos.z))

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		controlled = true
