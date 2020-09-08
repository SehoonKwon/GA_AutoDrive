function move_car3 (obj, event,hfigure)

global W;
global count;
global Gen;

handles = guidata(hfigure);
car=handles.car;
car2=handles.car2;
car3=handles.car3;
car4=handles.car4;
car5=handles.car5;
car6=handles.car6;
car7=handles.car7;
car8=handles.car8;
car9=handles.car9;
car10=handles.car10;
track= handles.track;
lineline= handles.lineline;

speed1= 0.12;
my_angle1 = pi/50;

speed2 = 0.12;
my_angle2 = pi/20;

speed3 = 0.12;
my_angle3 = pi/60;

speed4 = 0.12;
my_angle4 = pi/60;

speed5 = 0.12;
my_angle5 = pi/60;

speed6 = 0.12;
my_angle6 = pi/60;

speed7 = 0.12;
my_angle7 = pi/60;

speed8 = 0.12;
my_angle8 = pi/60;

speed9 = 0.12;
my_angle9 = pi/60;

speed10 = 0.12;
my_angle10 = pi/60;

track.xtrans=transpose(track.xdata1);
track.ytrans=transpose(track.ydata1);

car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3)  ) / 2;
car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3)  ) / 2;

car.sensor_1_3_x = ((car.s1_cx + car.s1_x(1,3))-car.x_c)*cos(car.angle) - ((car.s1_cy+car.s1_y(1,3)) - car.y_c)*sin(car.angle)+car.x_c;
car.sensor_1_3_y = ((car.s1_cx + car.s1_x(1,3))-car.x_c)*sin(car.angle) + ((car.s1_cy+car.s1_y(1,3)) - car.y_c)*cos(car.angle)+car.y_c;

a_l= ( car.y_c - car.sensor_1_3_y ) / (car.x_c -  car.sensor_1_3_x);
b_l= car.y_c-(car.x_c*a_l);                     % 왼쪽 센서의 관한 식

car.sensor_1_2_x = ((car.s2_cx + car.s2_x(1,2))-car.x_c)*cos(car.angle) - ((car.s2_cy+car.s2_y(1,2)) - car.y_c)*sin(car.angle)+car.x_c;
car.sensor_1_2_y =((car.s2_cx + car.s2_x(1,2))-car.x_c)*sin(car.angle) + ((car.s2_cy+car.s2_y(1,2)) - car.y_c)*cos(car.angle)+car.y_c;

a_r= ( car.y_c - car.sensor_1_2_y ) / (car.x_c -  car.sensor_1_2_x);
b_r= car.y_c-(car.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car.ssl= sensor_distance( track.xtrans, track.ytrans, car.sensor_1_3_x, car.sensor_1_3_y , car.x_c , car.y_c, a_l,b_l);  % 왼쪽 센서 거리
car.ssr = sensor_distance( track.xtrans, track.ytrans,car.sensor_1_2_x, car.sensor_1_2_y , car.x_c , car.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed, neur_angle] = calcul_result(car.ssl, car.ssr, W(1,:));

%부딪히는 조건
if car.ssl < 0.255 || car.ssr < 0.255
    car.d = 0;
    car.s1_d = 0;
    car.s2_d = 0;
else
    car.angle = neur_angle+car.angle;
    car.px = car.cx; car.py =car.cy;
    car.d=neur_speed;
    car.cx = car.px + car.d*cos(car.angle);
    car.cy = car.py+ car.d*sin(car.angle);
    
    car.s1_px = car.s1_cx; car.s1_py =car.s1_cy;
    car.s1_d=neur_speed;
    car.s1_cx = car.s1_px + car.s1_d*cos(car.angle);
    car.s1_cy = car.s1_py+ car.s1_d*sin(car.angle);
    
    car.s2_px = car.s2_cx; car.s2_py =car.s2_cy;
    car.s2_d=neur_speed;
    car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
    car.s2_cy = car.s2_py+ car.s2_d*sin(car.angle);
    
    car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3)  ) / 2;
    car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3)  ) / 2;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 아래 추가 2번째 car


car2.x_c = (2*car2.cx+car2.x(1,1)+car2.x(1,3)  ) / 2;
car2.y_c = (2*car2.cy+car2.y(1,1)+car2.y(1,3)  ) / 2;

car2.sensor_1_3_x =((car2.s1_cx + car2.s1_x(1,3))-car2.x_c)*cos(car2.angle) - ((car2.s1_cy+car2.s1_y(1,3)) - car2.y_c)*sin(car2.angle)+car2.x_c;
car2.sensor_1_3_y = ((car2.s1_cx + car2.s1_x(1,3))-car2.x_c)*sin(car2.angle) + ((car2.s1_cy+car2.s1_y(1,3)) - car2.y_c)*cos(car2.angle)+car2.y_c;

a_l= ( car2.y_c - car2.sensor_1_3_y ) / (car2.x_c -  car2.sensor_1_3_x);
b_l= car2.y_c-(car2.x_c*a_l);                     % 왼쪽 센서의 관한 식

car2.sensor_1_2_x = ((car2.s2_cx + car2.s2_x(1,2))-car2.x_c)*cos(car2.angle) - ((car2.s2_cy+car2.s2_y(1,2)) - car2.y_c)*sin(car2.angle)+car2.x_c;
car2.sensor_1_2_y =((car2.s2_cx + car2.s2_x(1,2))-car2.x_c)*sin(car2.angle) + ((car2.s2_cy+car2.s2_y(1,2)) - car2.y_c)*cos(car2.angle)+car2.y_c;

a_r= ( car2.y_c - car2.sensor_1_2_y ) / (car2.x_c -  car2.sensor_1_2_x);
b_r= car2.y_c-(car2.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car2.ssl= sensor_distance( track.xtrans, track.ytrans, car2.sensor_1_3_x, car2.sensor_1_3_y , car2.x_c , car2.y_c, a_l,b_l);  % 왼쪽 센서 거리
car2.ssr = sensor_distance( track.xtrans, track.ytrans,car2.sensor_1_2_x, car2.sensor_1_2_y , car2.x_c , car2.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed2, neur_angle2] = calcul_result(car2.ssl, car2.ssr, W(2,:));

if car2.ssl < 0.255 || car2.ssr < 0.255
    car2.d = 0;
    car2.s1_d = 0;
    car2.s2_d = 0;
else
    car2.angle =neur_angle2+car2.angle;
    car2.px = car2.cx; car2.py =car2.cy;
    car2.d=neur_speed2;
    car2.cx = car2.px + car2.d*cos(car2.angle);
    car2.cy = car2.py+ car2.d*sin(car2.angle);
    
    car2.s1_px = car2.s1_cx; car2.s1_py =car2.s1_cy;
    car2.s1_d=neur_speed2;
    car2.s1_cx = car2.s1_px + car2.s1_d*cos(car2.angle);
    car2.s1_cy = car2.s1_py+ car2.s1_d*sin(car2.angle);
    
    car2.s2_px = car2.s2_cx; car2.s2_py =car2.s2_cy;
    car2.s2_d=neur_speed2;
    car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
    car2.s2_cy = car2.s2_py+ car2.s2_d*sin(car2.angle);
    
    car2.x_c = (2*car2.cx+car2.x(1,1)+car2.x(1,3)  ) / 2;
    car2.y_c = (2*car2.cy+car2.y(1,1)+car2.y(1,3)  ) / 2;
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%% 3번째 car
car3.x_c = (2*car3.cx+car3.x(1,1)+car3.x(1,3)  ) / 2;
car3.y_c = (2*car3.cy+car3.y(1,1)+car3.y(1,3)  ) / 2;

car3.sensor_1_3_x =((car3.s1_cx + car3.s1_x(1,3))-car3.x_c)*cos(car3.angle) - ((car3.s1_cy+car3.s1_y(1,3)) - car3.y_c)*sin(car3.angle)+car3.x_c;
car3.sensor_1_3_y = ((car3.s1_cx + car3.s1_x(1,3))-car3.x_c)*sin(car3.angle) + ((car3.s1_cy+car3.s1_y(1,3)) - car3.y_c)*cos(car3.angle)+car3.y_c;

a_l= ( car3.y_c - car3.sensor_1_3_y ) / (car3.x_c -  car3.sensor_1_3_x);
b_l= car3.y_c-(car3.x_c*a_l);                     % 왼쪽 센서의 관한 식

car3.sensor_1_2_x = ((car3.s2_cx + car3.s2_x(1,2))-car3.x_c)*cos(car3.angle) - ((car3.s2_cy+car3.s2_y(1,2)) - car3.y_c)*sin(car3.angle)+car3.x_c;
car3.sensor_1_2_y =((car3.s2_cx + car3.s2_x(1,2))-car3.x_c)*sin(car3.angle) + ((car3.s2_cy+car3.s2_y(1,2)) - car3.y_c)*cos(car3.angle)+car3.y_c;

a_r= ( car3.y_c - car3.sensor_1_2_y ) / (car3.x_c -  car3.sensor_1_2_x);
b_r= car3.y_c-(car3.x_c*a_r);                         % 오른쪽 센서의 관한 식


%% 센서를 선택하게 만들어주는 코드
car3.ssl= sensor_distance( track.xtrans, track.ytrans, car3.sensor_1_3_x, car3.sensor_1_3_y , car3.x_c , car3.y_c, a_l,b_l);  % 왼쪽 센서 거리
car3.ssr = sensor_distance( track.xtrans, track.ytrans,car3.sensor_1_2_x, car3.sensor_1_2_y , car3.x_c , car3.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed3, neur_angle3] = calcul_result(car3.ssl, car3.ssr, W(3,:));
if car3.ssl < 0.255 || car3.ssr < 0.255
    car3.d = 0;
    car3.s1_d = 0;
    car3.s2_d = 0;
else
    car3.angle =neur_angle3+car3.angle;
    car3.px = car3.cx; car3.py =car3.cy;
    car3.d=neur_speed3;
    car3.cx = car3.px + car3.d*cos(car3.angle);
    car3.cy = car3.py+ car3.d*sin(car3.angle);
    
    car3.s1_px = car3.s1_cx; car3.s1_py =car3.s1_cy;
    car3.s1_d=neur_speed3;
    car3.s1_cx = car3.s1_px + car3.s1_d*cos(car3.angle);
    car3.s1_cy = car3.s1_py+ car3.s1_d*sin(car3.angle);
    
    car3.s2_px = car3.s2_cx; car3.s2_py =car3.s2_cy;
    car3.s2_d=neur_speed3;
    car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
    car3.s2_cy = car3.s2_py+ car3.s2_d*sin(car3.angle);
    
    car3.x_c = (2*car3.cx+car3.x(1,1)+car3.x(1,3)  ) / 2;
    car3.y_c = (2*car3.cy+car3.y(1,1)+car3.y(1,3)  ) / 2;
    
end


car4.x_c = (2*car4.cx+car4.x(1,1)+car4.x(1,3)  ) / 2;
car4.y_c = (2*car4.cy+car4.y(1,1)+car4.y(1,3)  ) / 2;

car4.sensor_1_3_x =((car4.s1_cx + car4.s1_x(1,3))-car4.x_c)*cos(car4.angle) - ((car4.s1_cy+car4.s1_y(1,3)) - car4.y_c)*sin(car4.angle)+car4.x_c;
car4.sensor_1_3_y = ((car4.s1_cx + car4.s1_x(1,3))-car4.x_c)*sin(car4.angle) + ((car4.s1_cy+car4.s1_y(1,3)) - car4.y_c)*cos(car4.angle)+car4.y_c;

a_l= ( car4.y_c - car4.sensor_1_3_y ) / (car4.x_c -  car4.sensor_1_3_x);
b_l= car4.y_c-(car4.x_c*a_l);                     % 왼쪽 센서의 관한 식

car4.sensor_1_2_x = ((car4.s2_cx + car4.s2_x(1,2))-car4.x_c)*cos(car4.angle) - ((car4.s2_cy+car4.s2_y(1,2)) - car4.y_c)*sin(car4.angle)+car4.x_c;
car4.sensor_1_2_y =((car4.s2_cx + car4.s2_x(1,2))-car4.x_c)*sin(car4.angle) + ((car4.s2_cy+car4.s2_y(1,2)) - car4.y_c)*cos(car4.angle)+car4.y_c;

a_r= ( car4.y_c - car4.sensor_1_2_y ) / (car4.x_c -  car4.sensor_1_2_x);
b_r= car4.y_c-(car4.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car4.ssl= sensor_distance( track.xtrans, track.ytrans, car4.sensor_1_3_x, car4.sensor_1_3_y , car4.x_c , car4.y_c, a_l,b_l);  % 왼쪽 센서 거리
car4.ssr = sensor_distance( track.xtrans, track.ytrans,car4.sensor_1_2_x, car4.sensor_1_2_y , car4.x_c , car4.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed4, neur_angle4] = calcul_result(car4.ssl, car4.ssr, W(4,:));

%부딪히는 조건
if car4.ssl < 0.255 || car4.ssr < 0.255
    car4.d = 0;
    car4.s1_d = 0;
    car4.s2_d = 0;
else
    car4.angle =neur_angle4+car4.angle;
    car4.px = car4.cx; car4.py =car4.cy;
    car4.d=neur_speed4;
    car4.cx = car4.px + car4.d*cos(car4.angle);
    car4.cy = car4.py+ car4.d*sin(car4.angle);
    
    car4.s1_px = car4.s1_cx; car4.s1_py =car4.s1_cy;
    car4.s1_d=neur_speed4;
    car4.s1_cx = car4.s1_px + car4.s1_d*cos(car4.angle);
    car4.s1_cy = car4.s1_py+ car4.s1_d*sin(car4.angle);
    
    car4.s2_px = car4.s2_cx; car4.s2_py =car4.s2_cy;
    car4.s2_d=neur_speed4;
    car4.s2_cx = car4.s2_px + car4.s2_d*cos(car4.angle);
    car4.s2_cy = car4.s2_py+ car4.s2_d*sin(car4.angle);
    
    car4.x_c = (2*car4.cx+car4.x(1,1)+car4.x(1,3)  ) / 2;
    car4.y_c = (2*car4.cy+car4.y(1,1)+car4.y(1,3)  ) / 2;
    
end

car5.x_c = (2*car5.cx+car5.x(1,1)+car5.x(1,3)  ) / 2;
car5.y_c = (2*car5.cy+car5.y(1,1)+car5.y(1,3)  ) / 2;

car5.sensor_1_3_x =((car5.s1_cx + car5.s1_x(1,3))-car5.x_c)*cos(car5.angle) - ((car5.s1_cy+car5.s1_y(1,3)) - car5.y_c)*sin(car5.angle)+car5.x_c;
car5.sensor_1_3_y = ((car5.s1_cx + car5.s1_x(1,3))-car5.x_c)*sin(car5.angle) + ((car5.s1_cy+car5.s1_y(1,3)) - car5.y_c)*cos(car5.angle)+car5.y_c;

a_l= ( car5.y_c - car5.sensor_1_3_y ) / (car5.x_c -  car5.sensor_1_3_x);
b_l= car5.y_c-(car5.x_c*a_l);                     % 왼쪽 센서의 관한 식

car5.sensor_1_2_x = ((car5.s2_cx + car5.s2_x(1,2))-car5.x_c)*cos(car5.angle) - ((car5.s2_cy+car5.s2_y(1,2)) - car5.y_c)*sin(car5.angle)+car5.x_c;
car5.sensor_1_2_y =((car5.s2_cx + car5.s2_x(1,2))-car5.x_c)*sin(car5.angle) + ((car5.s2_cy+car5.s2_y(1,2)) - car5.y_c)*cos(car5.angle)+car5.y_c;

a_r= ( car5.y_c - car5.sensor_1_2_y ) / (car5.x_c -  car5.sensor_1_2_x);
b_r= car5.y_c-(car5.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car5.ssl= sensor_distance( track.xtrans, track.ytrans, car5.sensor_1_3_x, car5.sensor_1_3_y , car5.x_c , car5.y_c, a_l,b_l);  % 왼쪽 센서 거리
car5.ssr = sensor_distance( track.xtrans, track.ytrans,car5.sensor_1_2_x, car5.sensor_1_2_y , car5.x_c , car5.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed5, neur_angle5] = calcul_result(car5.ssl, car5.ssr, W(5,:));

%부딪히는 조건
if car5.ssl < 0.255 || car5.ssr < 0.255
    car5.d = 0;
    car5.s1_d = 0;
    car5.s2_d = 0;
else
    car5.angle =neur_angle5+car5.angle;
    car5.px = car5.cx; car5.py =car5.cy;
    car5.d=neur_speed5;
    car5.cx = car5.px + car5.d*cos(car5.angle);
    car5.cy = car5.py+ car5.d*sin(car5.angle);
    
    car5.s1_px = car5.s1_cx; car5.s1_py =car5.s1_cy;
    car5.s1_d=neur_speed5;
    car5.s1_cx = car5.s1_px + car5.s1_d*cos(car5.angle);
    car5.s1_cy = car5.s1_py+ car5.s1_d*sin(car5.angle);
    
    car5.s2_px = car5.s2_cx; car5.s2_py =car5.s2_cy;
    car5.s2_d=neur_speed5;
    car5.s2_cx = car5.s2_px + car5.s2_d*cos(car5.angle);
    car5.s2_cy = car5.s2_py+ car5.s2_d*sin(car5.angle);
    
    car5.x_c = (2*car5.cx+car5.x(1,1)+car5.x(1,3)  ) / 2;
    car5.y_c = (2*car5.cy+car5.y(1,1)+car5.y(1,3)  ) / 2;
    
end

car6.x_c = (2*car6.cx+car6.x(1,1)+car6.x(1,3)  ) / 2;
car6.y_c = (2*car6.cy+car6.y(1,1)+car6.y(1,3)  ) / 2;

car6.sensor_1_3_x =((car6.s1_cx + car6.s1_x(1,3))-car6.x_c)*cos(car6.angle) - ((car6.s1_cy+car6.s1_y(1,3)) - car6.y_c)*sin(car6.angle)+car6.x_c;
car6.sensor_1_3_y = ((car6.s1_cx + car6.s1_x(1,3))-car6.x_c)*sin(car6.angle) + ((car6.s1_cy+car6.s1_y(1,3)) - car6.y_c)*cos(car6.angle)+car6.y_c;

a_l= ( car6.y_c - car6.sensor_1_3_y ) / (car6.x_c -  car6.sensor_1_3_x);
b_l= car6.y_c-(car6.x_c*a_l);                     % 왼쪽 센서의 관한 식

car6.sensor_1_2_x = ((car6.s2_cx + car6.s2_x(1,2))-car6.x_c)*cos(car6.angle) - ((car6.s2_cy+car6.s2_y(1,2)) - car6.y_c)*sin(car6.angle)+car6.x_c;
car6.sensor_1_2_y =((car6.s2_cx + car6.s2_x(1,2))-car6.x_c)*sin(car6.angle) + ((car6.s2_cy+car6.s2_y(1,2)) - car6.y_c)*cos(car6.angle)+car6.y_c;

a_r= ( car6.y_c - car6.sensor_1_2_y ) / (car6.x_c -  car6.sensor_1_2_x);
b_r= car6.y_c-(car6.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car6.ssl= sensor_distance( track.xtrans, track.ytrans, car6.sensor_1_3_x, car6.sensor_1_3_y , car6.x_c , car6.y_c, a_l,b_l);  % 왼쪽 센서 거리
car6.ssr = sensor_distance( track.xtrans, track.ytrans,car6.sensor_1_2_x, car6.sensor_1_2_y , car6.x_c , car6.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed6, neur_angle6] = calcul_result(car6.ssl, car6.ssr, W(6,:));

%부딪히는 조건
if car6.ssl < 0.255 || car6.ssr < 0.255
    car6.d = 0;
    car6.s1_d = 0;
    car6.s2_d = 0;
else
    car6.angle =neur_angle6+car6.angle;
    car6.px = car6.cx; car6.py =car6.cy;
    car6.d=neur_speed6;
    car6.cx = car6.px + car6.d*cos(car6.angle);
    car6.cy = car6.py+ car6.d*sin(car6.angle);
    
    car6.s1_px = car6.s1_cx; car6.s1_py =car6.s1_cy;
    car6.s1_d=neur_speed6;
    car6.s1_cx = car6.s1_px + car6.s1_d*cos(car6.angle);
    car6.s1_cy = car6.s1_py+ car6.s1_d*sin(car6.angle);
    
    car6.s2_px = car6.s2_cx; car6.s2_py =car6.s2_cy;
    car6.s2_d=neur_speed6;
    car6.s2_cx = car6.s2_px + car6.s2_d*cos(car6.angle);
    car6.s2_cy = car6.s2_py+ car6.s2_d*sin(car6.angle);
    
    car6.x_c = (2*car6.cx+car6.x(1,1)+car6.x(1,3)  ) / 2;
    car6.y_c = (2*car6.cy+car6.y(1,1)+car6.y(1,3)  ) / 2;
    
end

car7.x_c = (2*car7.cx+car7.x(1,1)+car7.x(1,3)  ) / 2;
car7.y_c = (2*car7.cy+car7.y(1,1)+car7.y(1,3)  ) / 2;

car7.sensor_1_3_x =((car7.s1_cx + car7.s1_x(1,3))-car7.x_c)*cos(car7.angle) - ((car7.s1_cy+car7.s1_y(1,3)) - car7.y_c)*sin(car7.angle)+car7.x_c;
car7.sensor_1_3_y = ((car7.s1_cx + car7.s1_x(1,3))-car7.x_c)*sin(car7.angle) + ((car7.s1_cy+car7.s1_y(1,3)) - car7.y_c)*cos(car7.angle)+car7.y_c;

a_l= ( car7.y_c - car7.sensor_1_3_y ) / (car7.x_c -  car7.sensor_1_3_x);
b_l= car7.y_c-(car7.x_c*a_l);                     % 왼쪽 센서의 관한 식

car7.sensor_1_2_x = ((car7.s2_cx + car7.s2_x(1,2))-car7.x_c)*cos(car7.angle) - ((car7.s2_cy+car7.s2_y(1,2)) - car7.y_c)*sin(car7.angle)+car7.x_c;
car7.sensor_1_2_y =((car7.s2_cx + car7.s2_x(1,2))-car7.x_c)*sin(car7.angle) + ((car7.s2_cy+car7.s2_y(1,2)) - car7.y_c)*cos(car7.angle)+car7.y_c;

a_r= ( car7.y_c - car7.sensor_1_2_y ) / (car7.x_c -  car7.sensor_1_2_x);
b_r= car7.y_c-(car7.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car7.ssl= sensor_distance( track.xtrans, track.ytrans, car7.sensor_1_3_x, car7.sensor_1_3_y , car7.x_c , car7.y_c, a_l,b_l);  % 왼쪽 센서 거리
car7.ssr = sensor_distance( track.xtrans, track.ytrans,car7.sensor_1_2_x, car7.sensor_1_2_y , car7.x_c , car7.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed7, neur_angle7] = calcul_result(car7.ssl, car7.ssr, W(7,:));

%부딪히는 조건
if car7.ssl < 0.255 || car7.ssr < 0.255
    car7.d = 0;
    car7.s1_d = 0;
    car7.s2_d = 0;
else
    car7.angle =neur_angle7+car7.angle;
    car7.px = car7.cx; car7.py =car7.cy;
    car7.d=neur_speed7;
    car7.cx = car7.px + car7.d*cos(car7.angle);
    car7.cy = car7.py+ car7.d*sin(car7.angle);
    
    car7.s1_px = car7.s1_cx; car7.s1_py =car7.s1_cy;
    car7.s1_d=neur_speed7;
    car7.s1_cx = car7.s1_px + car7.s1_d*cos(car7.angle);
    car7.s1_cy = car7.s1_py+ car7.s1_d*sin(car7.angle);
    
    car7.s2_px = car7.s2_cx; car7.s2_py =car7.s2_cy;
    car7.s2_d=neur_speed7;
    car7.s2_cx = car7.s2_px + car7.s2_d*cos(car7.angle);
    car7.s2_cy = car7.s2_py+ car7.s2_d*sin(car7.angle);
    
    car7.x_c = (2*car7.cx+car7.x(1,1)+car7.x(1,3)  ) / 2;
    car7.y_c = (2*car7.cy+car7.y(1,1)+car7.y(1,3)  ) / 2;
    
end


car8.x_c = (2*car8.cx+car8.x(1,1)+car8.x(1,3)  ) / 2;
car8.y_c = (2*car8.cy+car8.y(1,1)+car8.y(1,3)  ) / 2;

car8.sensor_1_3_x =((car8.s1_cx + car8.s1_x(1,3))-car8.x_c)*cos(car8.angle) - ((car8.s1_cy+car8.s1_y(1,3)) - car8.y_c)*sin(car8.angle)+car8.x_c;
car8.sensor_1_3_y = ((car8.s1_cx + car8.s1_x(1,3))-car8.x_c)*sin(car8.angle) + ((car8.s1_cy+car8.s1_y(1,3)) - car8.y_c)*cos(car8.angle)+car8.y_c;

a_l= ( car8.y_c - car8.sensor_1_3_y ) / (car8.x_c -  car8.sensor_1_3_x);
b_l= car8.y_c-(car8.x_c*a_l);                     % 왼쪽 센서의 관한 식

car8.sensor_1_2_x = ((car8.s2_cx + car8.s2_x(1,2))-car8.x_c)*cos(car8.angle) - ((car8.s2_cy+car8.s2_y(1,2)) - car8.y_c)*sin(car8.angle)+car8.x_c;
car8.sensor_1_2_y =((car8.s2_cx + car8.s2_x(1,2))-car8.x_c)*sin(car8.angle) + ((car8.s2_cy+car8.s2_y(1,2)) - car8.y_c)*cos(car8.angle)+car8.y_c;

a_r= ( car8.y_c - car8.sensor_1_2_y ) / (car8.x_c -  car8.sensor_1_2_x);
b_r= car8.y_c-(car8.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car8.ssl= sensor_distance( track.xtrans, track.ytrans, car8.sensor_1_3_x, car8.sensor_1_3_y , car8.x_c , car8.y_c, a_l,b_l);  % 왼쪽 센서 거리
car8.ssr = sensor_distance( track.xtrans, track.ytrans,car8.sensor_1_2_x, car8.sensor_1_2_y , car8.x_c , car8.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed8, neur_angle8] = calcul_result(car8.ssl, car8.ssr, W(8,:));

%부딪히는 조건
if car8.ssl < 0.255 || car8.ssr < 0.255
    car8.d = 0;
    car8.s1_d = 0;
    car8.s2_d = 0;
else
    car8.angle =neur_angle8+car8.angle;
    car8.px = car8.cx; car8.py =car8.cy;
    car8.d=neur_speed8;
    car8.cx = car8.px + car8.d*cos(car8.angle);
    car8.cy = car8.py+ car8.d*sin(car8.angle);
    
    car8.s1_px = car8.s1_cx; car8.s1_py =car8.s1_cy;
    car8.s1_d=neur_speed8;
    car8.s1_cx = car8.s1_px + car8.s1_d*cos(car8.angle);
    car8.s1_cy = car8.s1_py+ car8.s1_d*sin(car8.angle);
    
    car8.s2_px = car8.s2_cx; car8.s2_py =car8.s2_cy;
    car8.s2_d=neur_speed8;
    car8.s2_cx = car8.s2_px + car8.s2_d*cos(car8.angle);
    car8.s2_cy = car8.s2_py+ car8.s2_d*sin(car8.angle);
    
    car8.x_c = (2*car8.cx+car8.x(1,1)+car8.x(1,3)  ) / 2;
    car8.y_c = (2*car8.cy+car8.y(1,1)+car8.y(1,3)  ) / 2;
    
end

car9.x_c = (2*car9.cx+car9.x(1,1)+car9.x(1,3)  ) / 2;
car9.y_c = (2*car9.cy+car9.y(1,1)+car9.y(1,3)  ) / 2;

car9.sensor_1_3_x =((car9.s1_cx + car9.s1_x(1,3))-car9.x_c)*cos(car9.angle) - ((car9.s1_cy+car9.s1_y(1,3)) - car9.y_c)*sin(car9.angle)+car9.x_c;
car9.sensor_1_3_y = ((car9.s1_cx + car9.s1_x(1,3))-car9.x_c)*sin(car9.angle) + ((car9.s1_cy+car9.s1_y(1,3)) - car9.y_c)*cos(car9.angle)+car9.y_c;

a_l= ( car9.y_c - car9.sensor_1_3_y ) / (car9.x_c -  car9.sensor_1_3_x);
b_l= car9.y_c-(car9.x_c*a_l);                     % 왼쪽 센서의 관한 식

car9.sensor_1_2_x = ((car9.s2_cx + car9.s2_x(1,2))-car9.x_c)*cos(car9.angle) - ((car9.s2_cy+car9.s2_y(1,2)) - car9.y_c)*sin(car9.angle)+car9.x_c;
car9.sensor_1_2_y =((car9.s2_cx + car9.s2_x(1,2))-car9.x_c)*sin(car9.angle) + ((car9.s2_cy+car9.s2_y(1,2)) - car9.y_c)*cos(car9.angle)+car9.y_c;

a_r= ( car9.y_c - car9.sensor_1_2_y ) / (car9.x_c -  car9.sensor_1_2_x);
b_r= car9.y_c-(car9.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car9.ssl= sensor_distance( track.xtrans, track.ytrans, car9.sensor_1_3_x, car9.sensor_1_3_y , car9.x_c , car9.y_c, a_l,b_l);  % 왼쪽 센서 거리
car9.ssr = sensor_distance( track.xtrans, track.ytrans,car9.sensor_1_2_x, car9.sensor_1_2_y , car9.x_c , car9.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed9, neur_angle9] = calcul_result(car9.ssl, car9.ssr, W(9,:));

%부딪히는 조건
if car9.ssl < 0.255 || car9.ssr < 0.255
    car9.d = 0;
    car9.s1_d = 0;
    car9.s2_d = 0;
else
    car9.angle =neur_angle9+car9.angle;
    car9.px = car9.cx; car9.py =car9.cy;
    car9.d=neur_speed9;
    car9.cx = car9.px + car9.d*cos(car9.angle);
    car9.cy = car9.py+ car9.d*sin(car9.angle);
    
    car9.s1_px = car9.s1_cx; car9.s1_py =car9.s1_cy;
    car9.s1_d=neur_speed9;
    car9.s1_cx = car9.s1_px + car9.s1_d*cos(car9.angle);
    car9.s1_cy = car9.s1_py+ car9.s1_d*sin(car9.angle);
    
    car9.s2_px = car9.s2_cx; car9.s2_py =car9.s2_cy;
    car9.s2_d=neur_speed9;
    car9.s2_cx = car9.s2_px + car9.s2_d*cos(car9.angle);
    car9.s2_cy = car9.s2_py+ car9.s2_d*sin(car9.angle);
    
    car9.x_c = (2*car9.cx+car9.x(1,1)+car9.x(1,3)  ) / 2;
    car9.y_c = (2*car9.cy+car9.y(1,1)+car9.y(1,3)  ) / 2;
    
end

car10.x_c = (2*car10.cx+car10.x(1,1)+car10.x(1,3)  ) / 2;
car10.y_c = (2*car10.cy+car10.y(1,1)+car10.y(1,3)  ) / 2;

car10.sensor_1_3_x =((car10.s1_cx + car10.s1_x(1,3))-car10.x_c)*cos(car10.angle) - ((car10.s1_cy+car10.s1_y(1,3)) - car10.y_c)*sin(car10.angle)+car10.x_c;
car10.sensor_1_3_y = ((car10.s1_cx + car10.s1_x(1,3))-car10.x_c)*sin(car10.angle) + ((car10.s1_cy+car10.s1_y(1,3)) - car10.y_c)*cos(car10.angle)+car10.y_c;

a_l= ( car10.y_c - car10.sensor_1_3_y ) / (car10.x_c -  car10.sensor_1_3_x);
b_l= car10.y_c-(car10.x_c*a_l);                     % 왼쪽 센서의 관한 식

car10.sensor_1_2_x = ((car10.s2_cx + car10.s2_x(1,2))-car10.x_c)*cos(car10.angle) - ((car10.s2_cy+car10.s2_y(1,2)) - car10.y_c)*sin(car10.angle)+car10.x_c;
car10.sensor_1_2_y =((car10.s2_cx + car10.s2_x(1,2))-car10.x_c)*sin(car10.angle) + ((car10.s2_cy+car10.s2_y(1,2)) - car10.y_c)*cos(car10.angle)+car10.y_c;

a_r= ( car10.y_c - car10.sensor_1_2_y ) / (car10.x_c -  car10.sensor_1_2_x);
b_r= car10.y_c-(car10.x_c*a_r);                         % 오른쪽 센서의 관한 식

% 센서를 선택하게 만들어주는 코드
car10.ssl= sensor_distance( track.xtrans, track.ytrans, car10.sensor_1_3_x, car10.sensor_1_3_y , car10.x_c , car10.y_c, a_l,b_l);  % 왼쪽 센서 거리
car10.ssr = sensor_distance( track.xtrans, track.ytrans,car10.sensor_1_2_x, car10.sensor_1_2_y , car10.x_c , car10.y_c,a_r,b_r);  % 오른쪽 센서 거리

[neur_speed10, neur_angle10] = calcul_result(car10.ssl, car10.ssr, W(10,:));

%부딪히는 조건
if car10.ssl < 0.255 || car10.ssr < 0.255
    car10.d = 0;
    car10.s1_d = 0;
    car10.s2_d = 0;
else
    car10.angle =neur_angle10+car10.angle;
    car10.px = car10.cx; car10.py =car10.cy;
    car10.d=neur_speed10;
    car10.cx = car10.px + car10.d*cos(car10.angle);
    car10.cy = car10.py+ car10.d*sin(car10.angle);
    
    car10.s1_px = car10.s1_cx; car10.s1_py =car10.s1_cy;
    car10.s1_d=neur_speed10;
    car10.s1_cx = car10.s1_px + car10.s1_d*cos(car10.angle);
    car10.s1_cy = car10.s1_py+ car10.s1_d*sin(car10.angle);
    
    car10.s2_px = car10.s2_cx; car10.s2_py =car10.s2_cy;
    car10.s2_d=neur_speed10;
    car10.s2_cx = car10.s2_px + car10.s2_d*cos(car10.angle);
    car10.s2_cy = car10.s2_py+ car10.s2_d*sin(car10.angle);
    
    car10.x_c = (2*car10.cx+car10.x(1,1)+car10.x(1,3)  ) / 2;
    car10.y_c = (2*car10.cy+car10.y(1,1)+car10.y(1,3)  ) / 2;
    
end

car.dd = distance_calcul(car.ppx,car.x_c,car.ppy,car.y_c,car.dd);
car2.dd = distance_calcul(car2.ppx,car2.x_c,car2.ppy,car2.y_c,car2.dd);
car3.dd = distance_calcul(car3.ppx,car3.x_c,car3.ppy,car3.y_c,car3.dd);
car4.dd = distance_calcul(car4.ppx,car4.x_c,car4.ppy,car4.y_c,car4.dd);
car5.dd = distance_calcul(car5.ppx,car5.x_c,car5.ppy,car5.y_c,car5.dd);
car6.dd = distance_calcul(car6.ppx,car6.x_c,car6.ppy,car6.y_c,car6.dd);
car7.dd = distance_calcul(car7.ppx,car7.x_c,car7.ppy,car7.y_c,car7.dd);
car8.dd = distance_calcul(car8.ppx,car8.x_c,car8.ppy,car8.y_c,car8.dd);
car9.dd = distance_calcul(car9.ppx,car9.x_c,car9.ppy,car9.y_c,car9.dd);
car10.dd = distance_calcul(car10.ppx,car10.x_c,car10.ppy,car10.y_c,car10.dd);

car_distance=[car.dd car2.dd car3.dd car4.dd car5.dd car6.dd car7.dd car8.dd car9.dd car10.dd];
distance=car_distance;          % 가장 큰 값 가져오기
[max_value, max_index] = max(distance);
max1_distance = max_value;
%% 선두 차량들 색 바꾸기
first_max_index = max_index;
global color;
global CN;

%% 선두 W 그리기

for i=1 : 16
    if W(max_index,i) > 0
        lineline.color(i)='g';
        lineline.width(i)=abs(W(max_index,i));
    else
        lineline.color(i)='r';
        lineline.width(i)=abs(W(max_index,i));
    end
end

%%
switch max_index
    case 1
        max1_speed= neur_speed;
        max1_angle= neur_angle;
        distance=[0 car2.dd car3.dd car4.dd car5.dd car6.dd car7.dd car8.dd car9.dd car10.dd];
    case 2
        max1_speed= neur_speed2;
        max1_angle= neur_angle2;
        distance=[car.dd 0 car3.dd car4.dd car5.dd car6.dd car7.dd car8.dd car9.dd car10.dd];
    case 3
        max1_speed= neur_speed3;
        max1_angle= neur_angle3;
        max_value=0;
        distance=[car.dd car2.dd 0 car4.dd car5.dd car6.dd car7.dd car8.dd car9.dd car10.dd];
    case 4
        max1_speed= neur_speed4;
        max1_angle= neur_angle4;
        max_value=0;
        distance=[car.dd car2.dd car3.dd 0 car5.dd car6.dd car7.dd car8.dd car9.dd car10.dd];
    case 5
        max1_speed= neur_speed5;
        max1_angle= neur_angle5;
        max_value=0;
        distance=[car.dd car2.dd car3.dd car4.dd 0 car6.dd car7.dd car8.dd car9.dd car10.dd];
    case 6
        max1_speed= neur_speed6;
        max1_angle= neur_angle6;
        max_value=0;
        distance=[car.dd car2.dd car3.dd car4.dd car5.dd 0 car7.dd car8.dd car9.dd car10.dd];
    case 7
        max1_speed= neur_speed7;
        max1_angle= neur_angle7;
        max_value=0;
        distance=[car.dd car2.dd car3.dd car4.dd car5.dd car6.dd 0 car8.dd car9.dd car10.dd];
    case 8
        max1_speed= neur_speed8;
        max1_angle= neur_angle8;
        max_value=0;
        distance=[car.dd car2.dd car3.dd car4.dd car5.dd car6.dd car7.dd 0 car9.dd car10.dd];
    case 9
        max1_speed= neur_speed9;
        max1_angle= neur_angle9;
        max_value=0;
        distance=[car.dd car2.dd car3.dd car4.dd car5.dd car6.dd car7.dd car8.dd 0 car10.dd];
    case 10
        max1_speed= neur_speed10;
        max1_angle= neur_angle10;
        max_value=0;
        distance=[car.dd car2.dd car3.dd car4.dd car5.dd car6.dd car7.dd car8.dd car9.dd 0];
end

[max_value, max_index] = max(distance);              % 두번 째 큰값 가져오기
% max_index2= max_index;

for i = 1 : CN
    if i == max_index
        color(i,:) = 'g';
    elseif i == first_max_index
        color(i,:) = 'b';
    else
        color(i,:) = 'w';
    end
end


%% 리셋 기능

if (car.d==0 && car2.d==0 && car3.d==0 && car4.d==0 && car5.d==0 && car6.d==0 && car7.d==0 && car8.d==0 && car9.d==0 && car10.d==0) || max1_distance > 125
    
    
    Fitness= (max1_distance*100)/125.35;
    
    figure(2)
    
    plot(Gen, Fitness, 'o');
    grid on;
    hold on;
    xlabel('generation');
    ylabel('Fitness');
    title('tracking step by step');
    axis([ 0 100 0 100]);
    
    
    Gen = Gen + 1;
    % W = GA2(car_distance, W);
    W = GA_new(car_distance, W);
    disp(W);
    %% car1 reset
    car_x = [-0.5 1 1 -0.5];
    car_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car.x= car_x; car.y= car_y;
    car.s1_x = s1_x; car.s1_y = s1_y;
    car.s2_x = s2_x; car.s2_y = s2_y;
    car.cx=0;  car.cy= 0;
    car.s1_cx = 0; car.s1_cy = 0;
    car.s2_cx = 0; car.s2_cy = 0;
    car.ssl=0; car.ssr=0;
    
    % 차량 초기의 x와 y좌표
    car.px= 0; car.py=0;
    car.s1_px = 0; car.s1_py = 0;
    car.s2_px = 0; car.s2_py = 0;
    car.angle =2 * pi; % 차의 움직이는 방향 설정( 2pi 가 x축 양의 수평방향)
    car.d =0;
    car.s1_d=0;
    car.s2_d=0;
    car.ppx = 0 ; car.ppy = 0;
    
    car.dd=0;
    % 원점으로부터 움직인 거리
    car.speed = speed1;
    car.s1_speed = speed1;% 타이머가 불릴떄마다 차가 가는거리
    car.s2_speed = speed1;
    
    car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3)  ) / 2;
    car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3)  ) / 2;
    
    %% car2 reset
    
    car2_x = [-0.5 1 1 -0.5];
    car2_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car2.x= car2_x; car2.y= car2_y;
    car2.s1_x = s1_x; car2.s1_y = s1_y;
    car2.s2_x = s2_x; car2.s2_y = s2_y;
    car2.cx=0;  car2.cy= 0;
    car2.s1_cx = 0; car2.s1_cy = 0;
    car2.s2_cx = 0; car2.s2_cy = 0;
    car2.ssl=0; car2.ssr=0;
    
    % 차량 초기의 x와 y좌표
    car2.px= 0; car2.py=0;
    car2.s1_px = 0; car2.s1_py = 0;
    car2.s2_px = 0; car2.s2_py = 0;
    car2.angle =2 * pi; % 차의 움직이는 방향 설정( 2pi 가 x축 양의 수평방향)
    car2.d =0;
    car2.s1_d=0;
    car2.s2_d=0;
    car2.ppx = 0 ; car2.ppy = 0;
    
    car2.x_c = (2*car2.cx+car2.x(1,1)+car2.x(1,3)  ) / 2;
    car2.y_c = (2*car2.cy+car2.y(1,1)+car2.y(1,3)  ) / 2;
    car2.dd=0;
    % 원점으로부터 움직인 거리
    car2.speed = speed2;
    car2.s1_speed = speed2;% 타이머가 불릴떄마다 차가 가는거리
    car2.s2_speed = speed2;
    car2.angle = my_angle2; % 이걸 인자로 줘서 변화시키자 각도
    
    
    %% car 3 reset
    
    car3_x = [-0.5 1 1 -0.5];
    car3_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car3.x= car3_x; car3.y= car3_y;
    car3.s1_x = s1_x; car3.s1_y = s1_y;
    car3.s2_x = s2_x; car3.s2_y = s2_y;
    car3.cx=0;  car3.cy= 0;
    car3.s1_cx = 0; car3.s1_cy = 0;
    car3.s2_cx = 0; car3.s2_cy = 0;
    car3.ssl=0; car3.ssr=0;
    
    % 차량 초기의 x와 y좌표
    car3.px= 0; car3.py=0;
    car3.s1_px = 0; car3.s1_py = 0;
    car3.s2_px = 0; car3.s2_py = 0;
    car3.angle =2 * pi; % 차의 움직이는 방향 설정( 2pi 가 x축 양의 수평방향)
    car3.d =0;
    car3.s1_d=0;
    car3.s2_d=0;
    car3.ppx = 0 ; car3.ppy = 0;
    
    car3.dd=0;
    % 원점으로부터 움직인 거리
    car3.speed = speed3;
    car3.s1_speed = speed3;% 타이머가 불릴떄마다 차가 가는거리
    car3.s2_speed = speed3;
    
    car3.angle = my_angle3;
    
    car3.x_c = (2*car3.cx+car3.x(1,1)+car3.x(1,3)  ) / 2;
    car3.y_c = (2*car3.cy+car3.y(1,1)+car3.y(1,3)  ) / 2;
    
    %% car4 reset
    car4_x = [-0.5 1 1 -0.5];
    car4_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car4.x= car4_x; car4.y= car4_y;
    car4.s1_x = s1_x; car4.s1_y = s1_y;
    car4.s2_x = s2_x; car4.s2_y = s2_y;
    car4.cx=0;  car4.cy= 0;
    car4.s1_cx = 0; car4.s1_cy = 0;
    car4.s2_cx = 0; car4.s2_cy = 0;
    car4.ssl=0; car4.ssr=0;
    
    car4.px= 0; car4.py=0;
    car4.s1_px = 0; car4.s1_py = 0;
    car4.s2_px = 0; car4.s2_py = 0;
    car4.angle =2 * pi;
    car4.d =0;
    car4.s1_d=0;
    car4.s2_d=0;
    car4.ppx = 0 ; car4.ppy = 0;
    
    car4.dd=0;
    
    car4.speed = speed1;
    car4.s1_speed = speed1;
    car4.s2_speed = speed1;
    
    car4.x_c = (2*car4.cx+car4.x(1,1)+car4.x(1,3)  ) / 2;
    car4.y_c = (2*car4.cy+car4.y(1,1)+car4.y(1,3)  ) / 2;
    
    %% car5 reset
    car5_x = [-0.5 1 1 -0.5];
    car5_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car5.x= car5_x; car5.y= car5_y;
    car5.s1_x = s1_x; car5.s1_y = s1_y;
    car5.s2_x = s2_x; car5.s2_y = s2_y;
    car5.cx=0;  car5.cy= 0;
    car5.s1_cx = 0; car5.s1_cy = 0;
    car5.s2_cx = 0; car5.s2_cy = 0;
    car5.ssl=0; car5.ssr=0;
    
    car5.px= 0; car5.py=0;
    car5.s1_px = 0; car5.s1_py = 0;
    car5.s2_px = 0; car5.s2_py = 0;
    car5.angle =2 * pi;
    car5.d =0;
    car5.s1_d=0;
    car5.s2_d=0;
    car5.ppx = 0 ; car5.ppy = 0;
    
    car5.dd=0;
    
    car5.speed = speed1;
    car5.s1_speed = speed1;
    car5.s2_speed = speed1;
    
    car5.x_c = (2*car5.cx+car5.x(1,1)+car5.x(1,3)  ) / 2;
    car5.y_c = (2*car5.cy+car5.y(1,1)+car5.y(1,3)  ) / 2;
    
    %% car6 reset
    car6_x = [-0.5 1 1 -0.5];
    car6_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car6.x= car6_x; car6.y= car6_y;
    car6.s1_x = s1_x; car6.s1_y = s1_y;
    car6.s2_x = s2_x; car6.s2_y = s2_y;
    car6.cx=0;  car6.cy= 0;
    car6.s1_cx = 0; car6.s1_cy = 0;
    car6.s2_cx = 0; car6.s2_cy = 0;
    car6.ssl=0; car6.ssr=0;
    
    car6.px= 0; car6.py=0;
    car6.s1_px = 0; car6.s1_py = 0;
    car6.s2_px = 0; car6.s2_py = 0;
    car6.angle =2 * pi;
    car6.d =0;
    car6.s1_d=0;
    car6.s2_d=0;
    car6.ppx = 0 ; car6.ppy = 0;
    
    car6.dd=0;
    
    car6.speed = speed1;
    car6.s1_speed = speed1;
    car6.s2_speed = speed1;
    
    car6.x_c = (2*car6.cx+car6.x(1,1)+car6.x(1,3)  ) / 2;
    car6.y_c = (2*car6.cy+car6.y(1,1)+car6.y(1,3)  ) / 2;
    
    %% car7 reset
    car7_x = [-0.5 1 1 -0.5];
    car7_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car7.x= car7_x; car7.y= car7_y;
    car7.s1_x = s1_x; car7.s1_y = s1_y;
    car7.s2_x = s2_x; car7.s2_y = s2_y;
    car7.cx=0;  car7.cy= 0;
    car7.s1_cx = 0; car7.s1_cy = 0;
    car7.s2_cx = 0; car7.s2_cy = 0;
    car7.ssl=0; car7.ssr=0;
    
    car7.px= 0; car7.py=0;
    car7.s1_px = 0; car7.s1_py = 0;
    car7.s2_px = 0; car7.s2_py = 0;
    car7.angle =2 * pi;
    car7.d =0;
    car7.s1_d=0;
    car7.s2_d=0;
    car7.ppx = 0 ; car7.ppy = 0;
    
    car7.dd=0;
    
    car7.speed = speed1;
    car7.s1_speed = speed1;
    car7.s2_speed = speed1;
    
    car7.x_c = (2*car7.cx+car7.x(1,1)+car7.x(1,3)  ) / 2;
    car7.y_c = (2*car7.cy+car7.y(1,1)+car7.y(1,3)  ) / 2;
    
    %% car8 reset
    car8_x = [-0.5 1 1 -0.5];
    car8_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car8.x= car8_x; car8.y= car8_y;
    car8.s1_x = s1_x; car8.s1_y = s1_y;
    car8.s2_x = s2_x; car8.s2_y = s2_y;
    car8.cx=0;  car8.cy= 0;
    car8.s1_cx = 0; car8.s1_cy = 0;
    car8.s2_cx = 0; car8.s2_cy = 0;
    car8.ssl=0; car8.ssr=0;
    
    car8.px= 0; car8.py=0;
    car8.s1_px = 0; car8.s1_py = 0;
    car8.s2_px = 0; car8.s2_py = 0;
    car8.angle =2 * pi;
    car8.d =0;
    car8.s1_d=0;
    car8.s2_d=0;
    car8.ppx = 0 ; car8.ppy = 0;
    
    car8.dd=0;
    
    car8.speed = speed1;
    car8.s1_speed = speed1;
    car8.s2_speed = speed1;
    
    car8.x_c = (2*car8.cx+car8.x(1,1)+car8.x(1,3)  ) / 2;
    car8.y_c = (2*car8.cy+car8.y(1,1)+car8.y(1,3)  ) / 2;
    
    %% car9 reset
    car9_x = [-0.5 1 1 -0.5];
    car9_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car9.x= car9_x; car9.y= car9_y;
    car9.s1_x = s1_x; car9.s1_y = s1_y;
    car9.s2_x = s2_x; car9.s2_y = s2_y;
    car9.cx=0;  car9.cy= 0;
    car9.s1_cx = 0; car9.s1_cy = 0;
    car9.s2_cx = 0; car9.s2_cy = 0;
    car9.ssl=0; car9.ssr=0;
    
    car9.px= 0; car9.py=0;
    car9.s1_px = 0; car9.s1_py = 0;
    car9.s2_px = 0; car9.s2_py = 0;
    car9.angle =2 * pi;
    car9.d =0;
    car9.s1_d=0;
    car9.s2_d=0;
    car9.ppx = 0 ; car9.ppy = 0;
    
    car9.dd=0;
    
    car9.speed = speed1;
    car9.s1_speed = speed1;
    car9.s2_speed = speed1;
    
    car9.x_c = (2*car9.cx+car9.x(1,1)+car9.x(1,3)  ) / 2;
    car9.y_c = (2*car9.cy+car9.y(1,1)+car9.y(1,3)  ) / 2;
    
    %% car10 reset
    car10_x = [-0.5 1 1 -0.5];
    car10_y = [-0.3 -0.3 0.3 0.3];
    
    s1_x = [0.7 1 1 0.7];
    s1_y = [0.2 0.2 0.3 0.3];
    s2_x = [0.7 1 1 0.7];
    s2_y = [-0.2 -0.2 -0.3 -0.3];
    
    car10.x= car10_x; car10.y= car10_y;
    car10.s1_x = s1_x; car10.s1_y = s1_y;
    car10.s2_x = s2_x; car10.s2_y = s2_y;
    car10.cx=0;  car10.cy= 0;
    car10.s1_cx = 0; car10.s1_cy = 0;
    car10.s2_cx = 0; car10.s2_cy = 0;
    car10.ssl=0; car10.ssr=0;
    
    car10.px= 0; car10.py=0;
    car10.s1_px = 0; car10.s1_py = 0;
    car10.s2_px = 0; car10.s2_py = 0;
    car10.angle =2 * pi;
    car10.d =0;
    car10.s1_d=0;
    car10.s2_d=0;
    car10.ppx = 0 ; car10.ppy = 0;
    
    car10.dd=0;
    
    car10.speed = speed1;
    car10.s1_speed = speed1;
    car10.s2_speed = speed1;
    
    car10.x_c = (2*car10.cx+car10.x(1,1)+car10.x(1,3)  ) / 2;
    car10.y_c = (2*car10.cy+car10.y(1,1)+car10.y(1,3)  ) / 2;
    
end

global flag;

% 근데 굳이 매번 기록하면 가뜩이나 연산이 느린데 고작 한 발자국 가는 것도 저장해서
% 연산양이 많아짐. 그냥 일정 거리 이상 됐을때만 하는게 더 좋지 않나?
% 하는 방식은 일정 거리를 갔을 때 W를 기록하고 그 전과 거리를 비교하여 큰 값으로 갱신
% 기준 카운트가 되면 W값을 엑셀로 추출하고 매트랩 종료
% if count > 1000
%     return;
% else
%     count = count + 1;
% end

[max_distance, max_distance_index] = max(car_distance);
if max_distance > 120
    if flag == 1
        saveW = W(max_distance_index, :);
        filename = 'saveW.xlsx';
        xlswrite(filename, saveW);
        flag = 0;
    end
end

X = ((car.cx+car.x)-car.x_c)*cos(car.angle) - ((car.cy+car.y) - car.y_c)*sin(car.angle)+car.x_c;
Y = ((car.cx+car.x)-car.x_c)*sin(car.angle) + ((car.cy+car.y) - car.y_c)*cos(car.angle)+car.y_c;
SX1 = ((car.s1_cx + car.s1_x)-car.x_c)*cos(car.angle) - ((car.s1_cy+car.s1_y) - car.y_c)*sin(car.angle)+car.x_c;
SY1 = ((car.s1_cx + car.s1_x)-car.x_c)*sin(car.angle) + ((car.s1_cy+car.s1_y) - car.y_c)*cos(car.angle)+car.y_c;
SX2 = ((car.s2_cx + car.s2_x)-car.x_c)*cos(car.angle) - ((car.s2_cy+car.s2_y) - car.y_c)*sin(car.angle)+car.x_c;
SY2 = ((car.s2_cx + car.s2_x)-car.x_c)*sin(car.angle) + ((car.s2_cy+car.s2_y) - car.y_c)*cos(car.angle)+car.y_c;

X2 = ((car2.cx+car2.x)-car2.x_c)*cos(car2.angle) - ((car2.cy+car2.y) - car2.y_c)*sin(car2.angle)+car2.x_c;
Y2 = ((car2.cx+car2.x)-car2.x_c)*sin(car2.angle) + ((car2.cy+car2.y) - car2.y_c)*cos(car2.angle)+car2.y_c;
SX21 = ((car2.s1_cx + car2.s1_x)-car2.x_c)*cos(car2.angle) - ((car2.s1_cy+car2.s1_y) - car2.y_c)*sin(car2.angle)+car2.x_c;
SY21 = ((car2.s1_cx + car2.s1_x)-car2.x_c)*sin(car2.angle) + ((car2.s1_cy+car2.s1_y) - car2.y_c)*cos(car2.angle)+car2.y_c;
SX22 = ((car2.s2_cx + car2.s2_x)-car2.x_c)*cos(car2.angle) - ((car2.s2_cy+car2.s2_y) - car2.y_c)*sin(car2.angle)+car2.x_c;
SY22 = ((car2.s2_cx + car2.s2_x)-car2.x_c)*sin(car2.angle) + ((car2.s2_cy+car2.s2_y) - car2.y_c)*cos(car2.angle)+car2.y_c;

X3 = ((car3.cx+car3.x)-car3.x_c)*cos(car3.angle) - ((car3.cy+car3.y) - car3.y_c)*sin(car3.angle)+car3.x_c;
Y3 = ((car3.cx+car3.x)-car3.x_c)*sin(car3.angle) + ((car3.cy+car3.y) - car3.y_c)*cos(car3.angle)+car3.y_c;
SX31 = ((car3.s1_cx + car3.s1_x)-car3.x_c)*cos(car3.angle) - ((car3.s1_cy+car3.s1_y) - car3.y_c)*sin(car3.angle)+car3.x_c;
SY31 = ((car3.s1_cx + car3.s1_x)-car3.x_c)*sin(car3.angle) + ((car3.s1_cy+car3.s1_y) - car3.y_c)*cos(car3.angle)+car3.y_c;
SX32 = ((car3.s2_cx + car3.s2_x)-car3.x_c)*cos(car3.angle) - ((car3.s2_cy+car3.s2_y) - car3.y_c)*sin(car3.angle)+car3.x_c;
SY32 = ((car3.s2_cx + car3.s2_x)-car3.x_c)*sin(car3.angle) + ((car3.s2_cy+car3.s2_y) - car3.y_c)*cos(car3.angle)+car3.y_c;

X4 = ((car4.cx+car4.x)-car4.x_c)*cos(car4.angle) - ((car4.cy+car4.y) - car4.y_c)*sin(car4.angle)+car4.x_c;
Y4= ((car4.cx+car4.x)-car4.x_c)*sin(car4.angle) + ((car4.cy+car4.y) - car4.y_c)*cos(car4.angle)+car4.y_c;
SX41 = ((car4.s1_cx + car4.s1_x)-car4.x_c)*cos(car4.angle) - ((car4.s1_cy+car4.s1_y) - car4.y_c)*sin(car4.angle)+car4.x_c;
SY41 = ((car4.s1_cx + car4.s1_x)-car4.x_c)*sin(car4.angle) + ((car4.s1_cy+car4.s1_y) - car4.y_c)*cos(car4.angle)+car4.y_c;
SX42 = ((car4.s2_cx + car4.s2_x)-car4.x_c)*cos(car4.angle) - ((car4.s2_cy+car4.s2_y) - car4.y_c)*sin(car4.angle)+car4.x_c;
SY42 = ((car4.s2_cx + car4.s2_x)-car4.x_c)*sin(car4.angle) + ((car4.s2_cy+car4.s2_y) - car4.y_c)*cos(car4.angle)+car4.y_c;

X5 = ((car5.cx+car5.x)-car5.x_c)*cos(car5.angle) - ((car5.cy+car5.y) - car5.y_c)*sin(car5.angle)+car5.x_c;
Y5 = ((car5.cx+car5.x)-car5.x_c)*sin(car5.angle) + ((car5.cy+car5.y) - car5.y_c)*cos(car5.angle)+car5.y_c;
SX51 = ((car5.s1_cx + car5.s1_x)-car5.x_c)*cos(car5.angle) - ((car5.s1_cy+car5.s1_y) - car5.y_c)*sin(car5.angle)+car5.x_c;
SY51 = ((car5.s1_cx + car5.s1_x)-car5.x_c)*sin(car5.angle) + ((car5.s1_cy+car5.s1_y) - car5.y_c)*cos(car5.angle)+car5.y_c;
SX52 = ((car5.s2_cx + car5.s2_x)-car5.x_c)*cos(car5.angle) - ((car5.s2_cy+car5.s2_y) - car5.y_c)*sin(car5.angle)+car5.x_c;
SY52 = ((car5.s2_cx + car5.s2_x)-car5.x_c)*sin(car5.angle) + ((car5.s2_cy+car5.s2_y) - car5.y_c)*cos(car5.angle)+car5.y_c;

X6 = ((car6.cx+car6.x)-car6.x_c)*cos(car6.angle) - ((car6.cy+car6.y) - car6.y_c)*sin(car6.angle)+car6.x_c;
Y6 = ((car6.cx+car6.x)-car6.x_c)*sin(car6.angle) + ((car6.cy+car6.y) - car6.y_c)*cos(car6.angle)+car6.y_c;
SX61 = ((car6.s1_cx + car6.s1_x)-car6.x_c)*cos(car6.angle) - ((car6.s1_cy+car6.s1_y) - car6.y_c)*sin(car6.angle)+car6.x_c;
SY61 = ((car6.s1_cx + car6.s1_x)-car6.x_c)*sin(car6.angle) + ((car6.s1_cy+car6.s1_y) - car6.y_c)*cos(car6.angle)+car6.y_c;
SX62 = ((car6.s2_cx + car6.s2_x)-car6.x_c)*cos(car6.angle) - ((car6.s2_cy+car6.s2_y) - car6.y_c)*sin(car6.angle)+car6.x_c;
SY62 = ((car6.s2_cx + car6.s2_x)-car6.x_c)*sin(car6.angle) + ((car6.s2_cy+car6.s2_y) - car6.y_c)*cos(car6.angle)+car6.y_c;

X7 = ((car7.cx+car7.x)-car7.x_c)*cos(car7.angle) - ((car7.cy+car7.y) - car7.y_c)*sin(car7.angle)+car7.x_c;
Y7 = ((car7.cx+car7.x)-car7.x_c)*sin(car7.angle) + ((car7.cy+car7.y) - car7.y_c)*cos(car7.angle)+car7.y_c;
SX71 = ((car7.s1_cx + car7.s1_x)-car7.x_c)*cos(car7.angle) - ((car7.s1_cy+car7.s1_y) - car7.y_c)*sin(car7.angle)+car7.x_c;
SY71 = ((car7.s1_cx + car7.s1_x)-car7.x_c)*sin(car7.angle) + ((car7.s1_cy+car7.s1_y) - car7.y_c)*cos(car7.angle)+car7.y_c;
SX72 = ((car7.s2_cx + car7.s2_x)-car7.x_c)*cos(car7.angle) - ((car7.s2_cy+car7.s2_y) - car7.y_c)*sin(car7.angle)+car7.x_c;
SY72 = ((car7.s2_cx + car7.s2_x)-car7.x_c)*sin(car7.angle) + ((car7.s2_cy+car7.s2_y) - car7.y_c)*cos(car7.angle)+car7.y_c;

X8 = ((car8.cx+car8.x)-car8.x_c)*cos(car8.angle) - ((car8.cy+car8.y) - car8.y_c)*sin(car8.angle)+car8.x_c;
Y8 = ((car8.cx+car8.x)-car8.x_c)*sin(car8.angle) + ((car8.cy+car8.y) - car8.y_c)*cos(car8.angle)+car8.y_c;
SX81 = ((car8.s1_cx + car8.s1_x)-car8.x_c)*cos(car8.angle) - ((car8.s1_cy+car8.s1_y) - car8.y_c)*sin(car8.angle)+car8.x_c;
SY81 = ((car8.s1_cx + car8.s1_x)-car8.x_c)*sin(car8.angle) + ((car8.s1_cy+car8.s1_y) - car8.y_c)*cos(car8.angle)+car8.y_c;
SX82 = ((car8.s2_cx + car8.s2_x)-car8.x_c)*cos(car8.angle) - ((car8.s2_cy+car8.s2_y) - car8.y_c)*sin(car8.angle)+car8.x_c;
SY82 = ((car8.s2_cx + car8.s2_x)-car8.x_c)*sin(car8.angle) + ((car8.s2_cy+car8.s2_y) - car8.y_c)*cos(car8.angle)+car8.y_c;

X9 = ((car9.cx+car9.x)-car9.x_c)*cos(car9.angle) - ((car9.cy+car9.y) - car9.y_c)*sin(car9.angle)+car9.x_c;
Y9 = ((car9.cx+car9.x)-car9.x_c)*sin(car9.angle) + ((car9.cy+car9.y) - car9.y_c)*cos(car9.angle)+car9.y_c;
SX91 = ((car9.s1_cx + car9.s1_x)-car9.x_c)*cos(car9.angle) - ((car9.s1_cy+car9.s1_y) - car9.y_c)*sin(car9.angle)+car9.x_c;
SY91 = ((car9.s1_cx + car9.s1_x)-car9.x_c)*sin(car9.angle) + ((car9.s1_cy+car9.s1_y) - car9.y_c)*cos(car9.angle)+car9.y_c;
SX92 = ((car9.s2_cx + car9.s2_x)-car9.x_c)*cos(car9.angle) - ((car9.s2_cy+car9.s2_y) - car9.y_c)*sin(car9.angle)+car9.x_c;
SY92 = ((car9.s2_cx + car9.s2_x)-car9.x_c)*sin(car9.angle) + ((car9.s2_cy+car9.s2_y) - car9.y_c)*cos(car9.angle)+car9.y_c;

X10 = ((car10.cx+car10.x)-car10.x_c)*cos(car10.angle) - ((car10.cy+car10.y) - car10.y_c)*sin(car10.angle)+car10.x_c;
Y10= ((car10.cx+car10.x)-car10.x_c)*sin(car10.angle) + ((car10.cy+car10.y) - car10.y_c)*cos(car10.angle)+car10.y_c;
SX101 = ((car10.s1_cx + car10.s1_x)-car10.x_c)*cos(car10.angle) - ((car10.s1_cy+car10.s1_y) - car10.y_c)*sin(car10.angle)+car10.x_c;
SY101 = ((car10.s1_cx + car10.s1_x)-car10.x_c)*sin(car10.angle) + ((car10.s1_cy+car10.s1_y) - car10.y_c)*cos(car10.angle)+car10.y_c;
SX102 = ((car10.s2_cx + car10.s2_x)-car10.x_c)*cos(car10.angle) - ((car10.s2_cy+car10.s2_y) - car10.y_c)*sin(car10.angle)+car10.x_c;
SY102 = ((car10.s2_cx + car10.s2_x)-car10.x_c)*sin(car10.angle) + ((car10.s2_cy+car10.s2_y) - car10.y_c)*cos(car10.angle)+car10.y_c;



set(handles.car.p, 'XData',X);
set(handles.car.p, 'YData',Y);
set(handles.car.s1, 'XData',SX1);
set(handles.car.s1, 'YData',SY1);
set(handles.car.s2, 'XData',SX2);
set(handles.car.s2, 'YData',SY2);

set(handles.car2.p, 'XData',X2);
set(handles.car2.p, 'YData',Y2);
set(handles.car2.s1, 'XData',SX21);
set(handles.car2.s1, 'YData',SY21);
set(handles.car2.s2, 'XData',SX22);
set(handles.car2.s2, 'YData',SY22);

set(handles.car3.p, 'XData',X3);
set(handles.car3.p, 'YData',Y3);
set(handles.car3.s1, 'XData',SX31);
set(handles.car3.s1, 'YData',SY31);
set(handles.car3.s2, 'XData',SX32);
set(handles.car3.s2, 'YData',SY32);

set(handles.car4.p, 'XData',X4);
set(handles.car4.p, 'YData',Y4);
set(handles.car4.s1, 'XData',SX41);
set(handles.car4.s1, 'YData',SY41);
set(handles.car4.s2, 'XData',SX42);
set(handles.car4.s2, 'YData',SY42);

set(handles.car5.p, 'XData',X5);
set(handles.car5.p, 'YData',Y5);
set(handles.car5.s1, 'XData',SX51);
set(handles.car5.s1, 'YData',SY51);
set(handles.car5.s2, 'XData',SX52);
set(handles.car5.s2, 'YData',SY52);

set(handles.car6.p, 'XData',X6);
set(handles.car6.p, 'YData',Y6);
set(handles.car6.s1, 'XData',SX61);
set(handles.car6.s1, 'YData',SY61);
set(handles.car6.s2, 'XData',SX62);
set(handles.car6.s2, 'YData',SY62);

set(handles.car7.p, 'XData',X7);
set(handles.car7.p, 'YData',Y7);
set(handles.car7.s1, 'XData',SX71);
set(handles.car7.s1, 'YData',SY71);
set(handles.car7.s2, 'XData',SX72);
set(handles.car7.s2, 'YData',SY72);

set(handles.car8.p, 'XData',X8);
set(handles.car8.p, 'YData',Y8);
set(handles.car8.s1, 'XData',SX81);
set(handles.car8.s1, 'YData',SY81);
set(handles.car8.s2, 'XData',SX82);
set(handles.car8.s2, 'YData',SY82);

set(handles.car9.p, 'XData',X9);
set(handles.car9.p, 'YData',Y9);
set(handles.car9.s1, 'XData',SX91);
set(handles.car9.s1, 'YData',SY91);
set(handles.car9.s2, 'XData',SX92);
set(handles.car9.s2, 'YData',SY92);

set(handles.car10.p, 'XData',X10);
set(handles.car10.p, 'YData',Y10);
set(handles.car10.s1, 'XData',SX101);
set(handles.car10.s1, 'YData',SY101);
set(handles.car10.s2, 'XData',SX102);
set(handles.car10.s2, 'YData',SY102);

set(handles.car.p , 'Facecolor' , color(1,1));
set(handles.car2.p , 'Facecolor' , color(2,1));
set(handles.car3.p , 'Facecolor' ,color(3,1));
set(handles.car4.p , 'Facecolor' ,color(4,1));
set(handles.car5.p , 'Facecolor' ,color(5,1));
set(handles.car6.p , 'Facecolor' , color(6,1));
set(handles.car7.p , 'Facecolor' , color(7,1));
set(handles.car8.p , 'Facecolor' , color(8,1));
set(handles.car9.p , 'Facecolor' ,color(9,1));
set(handles.car10.p , 'Facecolor' , color(10,1));


set(handles.line1,'LineWidth',lineline.width(1),'color',lineline.color(1)); set(handles.line2,'LineWidth',lineline.width(2),'color',lineline.color(2));
set(handles.line3,'LineWidth',lineline.width(3),'color',lineline.color(3)); set(handles.line4,'LineWidth',lineline.width(4),'color',lineline.color(4));
set(handles.line5,'LineWidth',lineline.width(5),'color',lineline.color(5)); set(handles.line6,'LineWidth',lineline.width(6),'color',lineline.color(6));
set(handles.line7,'LineWidth',lineline.width(7),'color',lineline.color(7)); set(handles.line8,'LineWidth',lineline.width(8),'color',lineline.color(8));
set(handles.line9,'LineWidth',lineline.width(9),'color',lineline.color(9)); set(handles.line10,'LineWidth',lineline.width(10),'color',lineline.color(10));
set(handles.line11,'LineWidth',lineline.width(11),'color',lineline.color(11)); set(handles.line12,'LineWidth',lineline.width(12),'color',lineline.color(12));
set(handles.line13,'LineWidth',lineline.width(13),'color',lineline.color(13)); set(handles.line14,'LineWidth',lineline.width(14),'color',lineline.color(14));
set(handles.line15,'LineWidth',lineline.width(15),'color',lineline.color(15)); set(handles.line16,'LineWidth',lineline.width(16),'color',lineline.color(16));


car.ppx = car.x_c;
car.ppy = car.y_c;
car2.ppx = car2.x_c;
car2.ppy = car2.y_c;
car3.ppx = car3.x_c;
car3.ppy = car3.y_c;
car4.ppx = car4.x_c;
car4.ppy = car4.y_c;
car5.ppx = car5.x_c;
car5.ppy = car5.y_c;
car6.ppx = car6.x_c;
car6.ppy = car6.y_c;
car7.ppx = car7.x_c;
car7.ppy = car7.y_c;
car8.ppx = car8.x_c;
car8.ppy = car8.y_c;
car9.ppx = car9.x_c;
car9.ppy = car9.y_c;
car10.ppx = car10.x_c;
car10.ppy = car10.y_c;


set(handles.editAnswer,'String', max1_speed);
set(handles.editAnswer2,'String', max1_angle);
% set(handles.editAnswer3,'String', max2_speed);
% set(handles.editAnswer4,'String', max2_angle);
set(handles.editAnswer5,'String', max1_distance);
set(handles.editAnswer6,'String', Gen);

handles.car= car;
handles.car2= car2;
handles.car3= car3;
handles.car4= car4;
handles.car5= car5;
handles.car6= car6;
handles.car7= car7;
handles.car8= car8;
handles.car9= car9;
handles.car10= car10;
handles.lineline=lineline;

guidata (hfigure, handles);