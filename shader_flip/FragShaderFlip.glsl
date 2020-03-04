// The world pixel by pixel 2020
// Daniel Rozin
//  fragment shader to do a flip

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;


void main() {

vec2 sourcePixPosition ;
vec4 sourcePixColor;
	

	if (vertTexCoord.x< 0.5 && vertTexCoord.y< 0.5 ){                      // geting the coords of the source pixel by flipping it on one axis, ie 
		sourcePixPosition =  vec2(vertTexCoord.x,vertTexCoord.y);          //subtracting it from 1 (remember, pixel addresses are 0-1)                            
	}else if (vertTexCoord.x> 0.5 && vertTexCoord.y< 0.5 ){        
	  	sourcePixPosition =  vec2(1-vertTexCoord.x,vertTexCoord.y);  

	}else if (vertTexCoord.x<0.5 && vertTexCoord.y>0.5 ){        
   		sourcePixPosition =  vec2(vertTexCoord.x,1-vertTexCoord.y);  

	}else if (vertTexCoord.x>0.5 && vertTexCoord.y>0.5 ){        
   		sourcePixPosition =  vec2(1-vertTexCoord.x,1-vertTexCoord.y);  

	}

	sourcePixColor = texture2D(texture, sourcePixPosition);                   // getting the color of our source pixel
	gl_FragColor = sourcePixColor;                                            //  setting that color as the output
}
