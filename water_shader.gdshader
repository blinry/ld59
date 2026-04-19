shader_type spatial;

uniform sampler2D noise1;
uniform sampler2D noise2;
uniform vec3 blue: source_color;
uniform float timescale: hint_range(0.0,0.05,0.001);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 noise_color1 = texture(noise1,UV + TIME * timescale);
	vec4 noise_color2 = texture(noise2,UV + TIME * timescale * 2.0);
	ALBEDO = blue - (noise_color1.xyz / 2.0 ) + (noise_color2.xyz / 3.0);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
