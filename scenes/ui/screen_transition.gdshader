shader_type canvas_item;

uniform sampler2D wipeImage;
uniform float percent: hint_range(0.0, 1.0);

void fragment() {
	// Place fragment code here.
	float textval = texture(wipeImage, UV).r;
	
	if (textval >= percent) {
		COLOR.a = 0.0; 
	}
}
