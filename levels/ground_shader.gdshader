shader_type spatial;

uniform sampler2D noise;
uniform float green_threshold: hint_range(-10.0, 100.0, 0.1);
uniform float gray_threshold: hint_range(-10.0, 100.0, 0.1);
uniform float white_threshold: hint_range(-10.0, 100.0, 0.1);
uniform vec3 white: source_color;
uniform vec3 gray: source_color;
uniform vec3 green: source_color;
uniform vec3 sand: source_color;
varying vec3 world_position;

void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1)).xyz;
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	if (world_position.y < green_threshold) {
		ALBEDO = sand;
	}
	else if (world_position.y < gray_threshold) {
		ALBEDO = green;
	}
	else if (world_position.y < white_threshold) {
		//vec4 noise_color = texture(noise,world_position.xz);
		ALBEDO = gray;
	}
	else {
		ALBEDO = white;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
