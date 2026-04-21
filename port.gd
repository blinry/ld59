extends StaticBody3D
@onready var yippie_particles: CPUParticles3D = %YippieParticles


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_ship_detection_body_entered(body: Node3D) -> void:
	$Arrive.play()
	yippie_particles.emitting = true
	body.arrive()
