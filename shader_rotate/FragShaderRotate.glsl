// The world pixel by pixel 2020
// Daniel Rozin
//  fragment shader to do a rotation

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform float mouseX;
uniform float mouseY;
uniform float angle;

void main() {

	float distanceToMouse =  10*((mouseX-vertTexCoord.x)*(mouseX-vertTexCoord.x)+(mouseY-vertTexCoord.y)*(mouseY-vertTexCoord.y));   // calculating the distance from the mouse
	float cosangle = cos(distanceToMouse+angle);           					// calculating the cosine of our angle + the distance
	float sinangle = sin(distanceToMouse+angle);							// calculating the sine of our angle + the distance
//float cosangle = cos(angle);           					            // change to these for normal rotate
//float sinangle = sin(angle);
	float shiftX = mouseX-(mouseX *cosangle-mouseY *sinangle) ;            // calculating the source pixel for the center pixel so we can center it on the mouse
	float shiftY = mouseY-(mouseX*sinangle +mouseY*cosangle);
	float sourceX = vertTexCoord.x *cosangle-vertTexCoord.y *sinangle + shiftX ;     // calculating the source pixel for this pixel
	float sourceY = vertTexCoord.x *sinangle+vertTexCoord.y*cosangle +shiftY;


	vec2 sourcePixPosition =  vec2(sourceX, sourceY);                              // making a vec 2 vairable to hold the source position
	vec4 sourcePixColor = texture2D(texture, sourcePixPosition);                   // getting the color of our source pixel


	if (sourceX>0 && sourceX<1 && sourceY >0 && sourceY < 1){                      // make sure our source pixel in inside the window
	  gl_FragColor = sourcePixColor;                                               // if it is then set this pixel to the color of the source pixel
	}else{
	  gl_FragColor = vec4(0,0,0,1);                                               // if not, set it black
	}

}
