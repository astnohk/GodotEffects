shader_type canvas_item;

uniform sampler2D tex;
uniform float damper = 10.0;
uniform vec2 point1 = vec2(0.25, 0.5);
uniform vec2 point2 = vec2(0.5, 0.5);
uniform vec2 point3 = vec2(0.75, 0.5);
uniform float rot1 = 24.0;
uniform float rot2 = -25.0;
uniform float rot3 = 36.0;


mat2 rotmat(float th) {
	return mat2(
		vec2(cos(th), -sin(th)),
		vec2(sin(th), cos(th)));
}

void vertex() {
}

void fragment() {
	vec2 pos = UV.xy;
	vec2 p1 = pos - point1;
	vec2 p2 = pos - point2;
	vec2 p3 = pos - point3;
	float th1 = rot1 * exp(-damper * length(p1));
	float th2 = rot2 * exp(-damper * length(p2));
	float th3 = rot3 * exp(-damper * length(p3));
	vec2 new_pos = pos;
	float N = 64.0;
	for (float i = 0.0; i < N; i += 1.0) {
		new_pos = point1 + rotmat(th1 / N) * (new_pos - point1);
		new_pos = point2 + rotmat(th2 / N) * (new_pos - point2);
		new_pos = point3 + rotmat(th3 / N) * (new_pos - point3);
	}
	COLOR = texture(tex, new_pos.xy).rgba;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
