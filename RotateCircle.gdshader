shader_type canvas_item;

uniform float t = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 pos = 2.0 * UV.xy - vec2(1.0);
	pos = vec2(
		pos.x * cos(PI * t) - pos.y * sin(PI * t),
		pos.y * cos(PI * t) + pos.x * sin(PI * t));
	float d = length(pos) - 0.5 + 0.1 * sin(PI * t);
	float intensity = pow(1.0 / (50.0 * d), 2.0) *
		pow(0.5 + 0.5 * sin((1.0 + 0.5 * sin(PI * t * 0.3)) * 13.0 * atan(pos.y, pos.x)), 4.0);
	COLOR = vec4(intensity);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
