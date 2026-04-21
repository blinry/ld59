extends Camera3D

@onready var mouse_ray: RayCast3D = $MouseRay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var some_point = project_position(get_viewport().get_mouse_position(), 1000)
	#mouse_ray.global_position = Vector3(0,0,0)#global_position
	mouse_ray.target_position = to_local(some_point)
	#print($TestPoint.global_position)
	#$TestPoint.global_position = mouse_ray.get_collision_point()
	Globals.mouse_pos = mouse_ray.get_collision_point()
