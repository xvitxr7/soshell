#version 440
layout(location = 0) in vec2 fragCoord;
layout(location = 0) out vec4 fragColor;
varying highp vec2 qt_TexCoord0;

void main()
{
    fragCoord = qt_TextCoord0;
    float size = 1.0; //change size to well, change the size of your gradient
    vec2 squishness = vec2(1.0);

    vec4 color1 = vec4(0.424, 0.514, 0.718, 1);
    vec4 color2 = vec4(1);

    float step1 = 0.0;
    float step2 = 2.0;

    float radius = 10.0;
    float dots_distance = 15.0;

    vec2 topLeft = vec2(0.0, 1.0);
    vec2 topRight = vec2(1.0, 0.0);
   
    float t = sin(iTime / 10.0) * 0.5 + 0.5;
    vec2 center = mix(topLeft, topRight, t);

    vec2 UV = fragCoord / iResolution.xy;
	float dist = distance(center*squishness,UV*squishness);
	vec4 color = mix(color1, color2, smoothstep(step1*size, step2*size, dist));
    
    float t2 = iTime * 5.0;
    
    vec2 shiftedCoord = fragCoord - reflect(vec2(t2), vec2(1, 0));
    vec2 closestDot = floor(shiftedCoord / dots_distance) * dots_distance + vec2(dots_distance * 0.5);

    float distSq = pow(shiftedCoord.x - closestDot.x, 2.0) + pow(shiftedCoord.y - closestDot.y, 2.0);
    
    if (distSq < radius) {
        color = mix(vec4(1.0), color, vec4(0.7 + distSq * 0.01));
    }

    fragColor = color;
}
