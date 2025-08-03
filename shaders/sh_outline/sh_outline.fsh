//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 col;
uniform vec2 texture_Pixel;
uniform float width;
uniform float bottom;
void main()
{
	
	// change here thickness of outline 1.0, 2.0 etc.
	vec2 thickness = texture_Pixel * width;
	
	vec4 end_pixel =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if ( texture2D( gm_BaseTexture, v_vTexcoord ).a <= 0.0) { 
		
		float alpha = 0.0;
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - thickness.x , v_vTexcoord.y)).a );
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + thickness.x , v_vTexcoord.y)).a );
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + thickness.y)).a );		
		
		
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - thickness.x , v_vTexcoord.y + thickness.y)).a );
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + thickness.x , v_vTexcoord.y + thickness.y)).a );
		
		if (bottom != 0.0) {
			alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - thickness.y)).a );
			alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - thickness.x , v_vTexcoord.y - thickness.y)).a );
			alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + thickness.x , v_vTexcoord.y - thickness.y)).a );
		}
		 
		if (alpha != 0.0) { 
		end_pixel = col; }
		}
	
	
    gl_FragColor = end_pixel;
}