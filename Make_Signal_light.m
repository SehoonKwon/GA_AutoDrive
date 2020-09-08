function Signal_light = Make_Signal_light(color1, color2)
t= linspace(0,2*pi,50); R=0.55;
x= R*cos(t); y=R*sin(t);

Signal_light.blue = patch(x+4.15, y+15.3, color1);
Signal_light.red = patch(x+5.35, y+15.3, color2);

color2_1 = [0.98 0 0];
Signal_light.blue2 = patch(x-5.53, y+24.8, color1);
Signal_light.red2 = patch(x-4.31, y+24.8, color2_1);
end