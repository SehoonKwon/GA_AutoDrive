function move_car (obj, event,hfigure)

handles = guidata(hfigure);
car=handles.car;
car2=handles.car2;
car3=handles.car3;
track= handles.track;

speed1= 0.03;
my_angle1= pi/50;

speed2 = 0.055;
my_angle2 = pi/20;

speed3 = 0.045;
my_angle3 = pi/60;


%부딪히는 조건
if car.ssl < 0.48 || car.ssr < 0.48
    car.d = 0;
    car.s1_d = 0;
    car.s2_d = 0;
else
    
    car.d=car.d+car.speed;
    car.cx=car.px+car.d*cos(car.angle);
    car.cy= car.py + car.d*sin(car.angle);
    
    car.s1_d = car.s1_d+car.s1_speed;            % left 센서
    car.s1_cx = car.s1_px+car.s1_d*cos(car.angle);
    car.s1_cy = car.s1_py + car.s1_d*sin(car.angle);
    
    car.s2_d = car.s2_d+car.s2_speed;           % right 센서
    car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
    car.s2_cy = car.s2_py + car.s2_d*sin(car.angle);
end

track.xtrans=transpose(track.xdata1);
track.ytrans=transpose(track.ydata1);

car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3)  ) / 2;
car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3)  ) / 2;

car.sensor_1_3_x =((car.s1_cx + car.s1_x(1,3))-car.x_c)*cos(car.angle) - ((car.s1_cy+car.s1_y(1,3)) - car.y_c)*sin(car.angle)+car.x_c;
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

if car.ssl> car.ssr
    if car.ssr <= 1 && car.ssr >= 0.48
        car.angle =(pi/20)+car.angle;
        car.px = car.cx; car.py =car.cy;
        car.d=car.speed;
        car.cx = car.px + car.d*cos(car.angle);
        car.cy = car.py+ car.d*sin(car.angle);
        
        car.s1_px = car.s1_cx; car.s1_py =car.s1_cy;
        car.s1_d=car.s1_speed;
        car.s1_cx = car.s1_px + car.s1_d*cos(car.angle);
        car.s1_cy = car.s1_py+ car.s1_d*sin(car.angle);
        
        car.s2_px = car.s2_cx; car.s2_py =car.s2_cy;
        car.s2_d=car.s2_speed;
        car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
        car.s2_cy = car.s2_py+ car.s2_d*sin(car.angle);
        
        %부딪
    elseif car.ssl < 0.48 || car.ssr < 0.48
        car.speed=0;
        car.s1_d=0;
        car.s2_d=0;
    else
        car.px = car.cx; car.py = car.cy;
        car.d=car.speed;
        car.cx = car.px + car.d*cos(car.angle);
        car.cy = car.py+ car.d*sin(car.angle);
        
        car.s1_px = car.s1_cx; car.s1_py =car.s1_cy;
        car.s1_d=car.s1_speed;
        car.s1_cx = car.s1_px + car.s1_d*cos(car.angle);
        car.s1_cy = car.s1_py+ car.s1_d*sin(car.angle);
        
        car.s2_px = car.s2_cx; car.s2_py =car.s2_cy;
        car.s2_d=car.s2_speed;
        car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
        car.s2_cy = car.s2_py+ car.s2_d*sin(car.angle);
        
    end
    
elseif car.ssl < car.ssr
    if car.ssl<= 1     && car.ssl >= 0.48
        car.angle =(-pi/20)+car.angle;
        car.px = car.cx; car.py =car.cy;
        car.d=car.speed;
        car.cx = car.px + car.d*cos(car.angle);
        car.cy = car.py+ car.d*sin(car.angle);
        
        car.s1_px = car.s1_cx; car.s1_py =car.s1_cy;
        car.s1_d=car.s1_speed;
        car.s1_cx = car.s1_px + car.s1_d*cos(car.angle);
        car.s1_cy = car.s1_py+ car.s1_d*sin(car.angle);
        
        car.s2_px = car.s2_cx; car.s2_py =car.s2_cy;
        car.s2_d=car.s2_speed;
        car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
        car.s2_cy = car.s2_py+ car.s2_d*sin(car.angle);
        
    elseif car.ssl < 0.48 || car.ssr < 0.48
        car.d=0;
        car.s1_d=0;
        car.s2_d=0;
    else
        car.px = car.cx; car.py = car.cy;
        car.d=car.speed;
        car.cx = car.px + car.d*cos(car.angle);
        car.cy = car.py+ car.d*sin(car.angle);
        
        car.s1_px = car.s1_cx; car.s1_py =car.s1_cy;
        car.s1_d=car.s1_speed;
        car.s1_cx = car.s1_px + car.s1_d*cos(car.angle);
        car.s1_cy = car.s1_py+ car.s1_d*sin(car.angle);
        
        car.s2_px = car.s2_cx; car.s2_py =car.s2_cy;
        car.s2_d=car.s2_speed;
        car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
        car.s2_cy = car.s2_py+ car.s2_d*sin(car.angle);
    end
else
    if  car.ssl < 0.48 || car.ssr < 0.48
        car.d=0;
        car.s1_d=0;
        car.s2_d=0;
    else
        car.px = car.cx; car.py = car.cy;
        car.d=car.speed;
        car.cx = car.px + car.d*cos(car.angle);
        car.cy = car.py+ car.d*sin(car.angle);
        
        car.s1_px = car.s1_cx; car.s1_py =car.s1_cy;
        car.s1_d=car.s1_speed;
        car.s1_cx = car.s1_px + car.s1_d*cos(car.angle);
        car.s1_cy = car.s1_py+ car.s1_d*sin(car.angle);
        
        car.s2_px = car.s2_cx; car.s2_py =car.s2_cy;
        car.s2_d=car.s2_speed;
        car.s2_cx = car.s2_px + car.s2_d*cos(car.angle);
        car.s2_cy = car.s2_py+ car.s2_d*sin(car.angle);
    end
    
    
end

% 기존코드



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 아래 추가 2번째 car

if car2.ssl < 0.48 || car2.ssr < 0.48
    car2.d = 0;
    car2.s1_d = 0;
    car2.s2_d = 0;
else    
    track= handles.track;
    car2.d=car2.d+car2.speed;
    car2.cx=car2.px+car2.d*cos(car2.angle);
    car2.cy= car2.py + car2.d*sin(car2.angle);
    
    car2.s1_d = car2.s1_d+car2.s1_speed;            % left 센서
    car2.s1_cx = car2.s1_px+car2.s1_d*cos(car2.angle);
    car2.s1_cy = car2.s1_py + car2.s1_d*sin(car2.angle);
    
    car2.s2_d = car2.s2_d+car2.s2_speed;           % right 센서
    car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
    car2.s2_cy = car2.s2_py + car2.s2_d*sin(car2.angle);
    
end
track.xtrans=transpose(track.xdata1);
track.ytrans=transpose(track.ydata1);

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

%% 센서를 선택하게 만들어주는 코드
car2.ssl= sensor_distance( track.xtrans, track.ytrans, car2.sensor_1_3_x, car2.sensor_1_3_y , car2.x_c , car2.y_c, a_l,b_l);  % 왼쪽 센서 거리
car2.ssr = sensor_distance( track.xtrans, track.ytrans,car2.sensor_1_2_x, car2.sensor_1_2_y , car2.x_c , car2.y_c,a_r,b_r);  % 오른쪽 센서 거리

if car2.ssl> car2.ssr
    if car2.ssr <= 1 && car2.ssr >= 0.48
        car2.angle =(pi/20)+car2.angle;
        car2.px = car2.cx; car2.py =car2.cy;
        car2.d=car2.speed;
        car2.cx = car2.px + car2.d*cos(car2.angle);
        car2.cy = car2.py+ car2.d*sin(car2.angle);
        
        car2.s1_px = car2.s1_cx; car2.s1_py =car2.s1_cy;
        car2.s1_d=car2.s1_speed;
        car2.s1_cx = car2.s1_px + car2.s1_d*cos(car2.angle);
        car2.s1_cy = car2.s1_py+ car2.s1_d*sin(car2.angle);
        
        car2.s2_px = car2.s2_cx; car2.s2_py =car2.s2_cy;
        car2.s2_d=car2.s2_speed;
        car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
        car2.s2_cy = car2.s2_py+ car2.s2_d*sin(car2.angle);
        
        %부딪
    elseif car2.ssl < 0.48 || car2.ssr < 0.48
        car2.d=0;
        car2.s1_d=0;
        car2.s2_d=0;
    else
        car2.px = car2.cx; car2.py = car2.cy;
        car2.d=car2.speed;
        car2.cx = car2.px + car2.d*cos(car2.angle);
        car2.cy = car2.py+ car2.d*sin(car2.angle);
        
        car2.s1_px = car2.s1_cx; car2.s1_py =car2.s1_cy;
        car2.s1_d=car2.s1_speed;
        car2.s1_cx = car2.s1_px + car2.s1_d*cos(car2.angle);
        car2.s1_cy = car2.s1_py+ car2.s1_d*sin(car2.angle);
        
        car2.s2_px = car2.s2_cx; car2.s2_py =car2.s2_cy;
        car2.s2_d=car2.s2_speed;
        car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
        car2.s2_cy = car2.s2_py+ car2.s2_d*sin(car2.angle);
        
    end
    
elseif car2.ssl < car2.ssr
    if car2.ssl<= 1     && car2.ssl >= 0.48
        car2.angle =(-pi/20)+car2.angle;
        car2.px = car2.cx; car2.py =car2.cy;
        car2.d=car2.speed;
        car2.cx = car2.px + car2.d*cos(car2.angle);
        car2.cy = car2.py+ car2.d*sin(car2.angle);
        
        car2.s1_px = car2.s1_cx; car2.s1_py =car2.s1_cy;
        car2.s1_d=car2.s1_speed;
        car2.s1_cx = car2.s1_px + car2.s1_d*cos(car2.angle);
        car2.s1_cy = car2.s1_py+ car2.s1_d*sin(car2.angle);
        
        car2.s2_px = car2.s2_cx; car2.s2_py =car2.s2_cy;
        car2.s2_d=car2.s2_speed;
        car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
        car2.s2_cy = car2.s2_py+ car2.s2_d*sin(car2.angle);
        
    elseif car2.ssl < 0.48 || car2.ssr < 0.48
        car2.d=0;
        car2.s1_d=0;
        car2.s2_d=0;
    else
        car2.px = car2.cx; car2.py = car2.cy;
        car2.d=car2.speed;
        car2.cx = car2.px + car2.d*cos(car2.angle);
        car2.cy = car2.py+ car2.d*sin(car2.angle);
        
        car2.s1_px = car2.s1_cx; car2.s1_py =car2.s1_cy;
        car2.s1_d=car2.s1_speed;
        car2.s1_cx = car2.s1_px + car2.s1_d*cos(car2.angle);
        car2.s1_cy = car2.s1_py+ car2.s1_d*sin(car2.angle);
        
        car2.s2_px = car2.s2_cx; car2.s2_py =car2.s2_cy;
        car2.s2_d=car2.s2_speed;
        car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
        car2.s2_cy = car2.s2_py+ car2.s2_d*sin(car2.angle);
    end
else
    if  car2.ssl < 0.48 || car2.ssr < 0.48
        car2.d=0;
        car2.s1_d=0;
        car2.s2_d=0;
    else
        car2.px = car2.cx; car2.py = car2.cy;
        car2.d=car2.speed;
        car2.cx = car2.px + car2.d*cos(car2.angle);
        car2.cy = car2.py+ car2.d*sin(car2.angle);
        
        car2.s1_px = car2.s1_cx; car2.s1_py =car2.s1_cy;
        car2.s1_d=car2.s1_speed;
        car2.s1_cx = car2.s1_px + car2.s1_d*cos(car2.angle);
        car2.s1_cy = car2.s1_py+ car2.s1_d*sin(car2.angle);
        
        car2.s2_px = car2.s2_cx; car2.s2_py =car2.s2_cy;
        car2.s2_d=car2.s2_speed;
        car2.s2_cx = car2.s2_px + car2.s2_d*cos(car2.angle);
        car2.s2_cy = car2.s2_py+ car2.s2_d*sin(car2.angle);
    end
    
end



%%%%%%%%%%%%%%%%%%%%%%%%%% 3번째 car


if car3.ssl < 0.52 || car3.ssr < 0.52
    car3.d = 0;
    car3.s1_d = 0;
    car3.s2_d = 0;
else
    
    track= handles.track;
    car3.d=car3.d+car3.speed;
    car3.cx=car3.px+car3.d*cos(car3.angle);
    car3.cy= car3.py + car3.d*sin(car3.angle);
    
    car3.s1_d = car3.s1_d+car3.s1_speed;            % left 센서
    car3.s1_cx = car3.s1_px+car3.s1_d*cos(car3.angle);
    car3.s1_cy = car3.s1_py + car3.s1_d*sin(car3.angle);
    
    car3.s2_d = car3.s2_d+car3.s2_speed;           % right 센서
    car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
    car3.s2_cy = car3.s2_py + car3.s2_d*sin(car3.angle);
    
end
track.xtrans=transpose(track.xdata1);
track.ytrans=transpose(track.ydata1);

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

if car3.ssl> car3.ssr
    if car3.ssr<=1  &&car3.ssr >=0.52
        car3.angle =(pi/20)+car3.angle;
        car3.px = car3.cx; car3.py =car3.cy;
        car3.d=car3.speed;
        car3.cx = car3.px + car3.d*cos(car3.angle);
        car3.cy = car3.py+ car3.d*sin(car3.angle);
        
        car3.s1_px = car3.s1_cx; car3.s1_py =car3.s1_cy;
        car3.s1_d=car3.s1_speed;
        car3.s1_cx = car3.s1_px + car3.s1_d*cos(car3.angle);
        car3.s1_cy = car3.s1_py+ car3.s1_d*sin(car3.angle);
        
        car3.s2_px = car3.s2_cx; car3.s2_py =car3.s2_cy;
        car3.s2_d=car3.s2_speed;
        car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
        car3.s2_cy = car3.s2_py+ car3.s2_d*sin(car3.angle);
        
    elseif car3.ssl < 0.52 || car3.ssr < 0.52
        car3.d=0;
        car3.s1_d=0;
        car3.s2_d=0;
        
        
    else
        
        car3.px = car3.cx; car3.py =car3.cy;
        car3.d=car3.speed;
        car3.cx = car3.px + car3.d*cos(car3.angle);
        car3.cy = car3.py+ car3.d*sin(car3.angle);
        
        car3.s1_px = car3.s1_cx; car3.s1_py =car3.s1_cy;
        car3.s1_d=car3.s1_speed;
        car3.s1_cx = car3.s1_px + car3.s1_d*cos(car3.angle);
        car3.s1_cy = car3.s1_py+ car3.s1_d*sin(car3.angle);
        
        car3.s2_px = car3.s2_cx; car3.s2_py =car3.s2_cy;
        car3.s2_d=car3.s2_speed;
        car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
        car3.s2_cy = car3.s2_py+ car3.s2_d*sin(car3.angle);
    end
    
elseif car3.ssl < car3.ssr
    if car3.ssl<=1  && car3.ssl >=0.52
        car3.angle =(-pi/20)+car3.angle;
        car3.px = car3.cx; car3.py =car3.cy;
        car3.d=car3.speed;
        car3.cx = car3.px + car3.d*cos(car3.angle);
        car3.cy = car3.py+ car3.d*sin(car3.angle);
        
        car3.s1_px = car3.s1_cx; car3.s1_py =car3.s1_cy;
        car3.s1_d=car3.s1_speed;
        car3.s1_cx = car3.s1_px + car3.s1_d*cos(car3.angle);
        car3.s1_cy = car3.s1_py+ car3.s1_d*sin(car3.angle);
        
        car3.s2_px = car3.s2_cx; car3.s2_py =car3.s2_cy;
        car3.s2_d=car3.s2_speed;
        car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
        car3.s2_cy = car3.s2_py+ car3.s2_d*sin(car3.angle);
        
    elseif car3.ssl < 0.52 || car3.ssr < 0.52
        car3.d=0;
        car3.s1_d=0;
        car3.s2_d=0;
    else
        car3.px = car3.cx; car3.py =car3.cy;
        car3.d=car3.speed;
        car3.cx = car3.px + car3.d*cos(car3.angle);
        car3.cy = car3.py+ car3.d*sin(car3.angle);
        
        car3.s1_px = car3.s1_cx; car3.s1_py =car3.s1_cy;
        car3.s1_d=car3.s1_speed;
        car3.s1_cx = car3.s1_px + car3.s1_d*cos(car3.angle);
        car3.s1_cy = car3.s1_py+ car3.s1_d*sin(car3.angle);
        
        car3.s2_px = car3.s2_cx; car3.s2_py =car3.s2_cy;
        car3.s2_d=car3.s2_speed;
        car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
        car3.s2_cy = car3.s2_py+ car3.s2_d*sin(car3.angle);
    end
else
    if  car3.ssl < 0.52 || car3.ssr < 0.52
        car3.d=0;
        car3.s1_d=0;
        car3.s2_d=0;
    else
        car3.px = car3.cx; car3.py =car3.cy;
        car3.d=car3.speed;
        car3.cx = car3.px + car3.d*cos(car3.angle);
        car3.cy = car3.py+ car3.d*sin(car3.angle);
        
        car3.s1_px = car3.s1_cx; car3.s1_py =car3.s1_cy;
        car3.s1_d=car3.s1_speed;
        car3.s1_cx = car3.s1_px + car3.s1_d*cos(car3.angle);
        car3.s1_cy = car3.s1_py+ car3.s1_d*sin(car3.angle);
        
        car3.s2_px = car3.s2_cx; car3.s2_py =car3.s2_cy;
        car3.s2_d=car3.s2_speed;
        car3.s2_cx = car3.s2_px + car3.s2_d*cos(car3.angle);
        car3.s2_cy = car3.s2_py+ car3.s2_d*sin(car3.angle);
    end
    
end

car.dd = distance_calcul(car.ppx,car.x_c,car.ppy,car.y_c,car.dd);
car2.dd = distance_calcul(car2.ppx,car2.x_c,car2.ppy,car2.y_c,car2.dd);
car3.dd = distance_calcul(car3.ppx,car3.x_c,car3.ppy,car3.y_c,car3.dd);

distance=[car.dd car2.dd car3.dd ];             % 가장 큰 값 가져오기
[max_value, max_index] = max(distance);
switch max_index
    case 1
        max1_speed= car.d;
        max1_angle= car.angle;
        distance=[0 car2.dd car3.dd ];
    case 2
        max1_speed= car2.d;
        max1_angle= car2.angle;
        distance=[car.dd 0 car3.dd ];
    case 3
        max1_speed= car3.d;
        max1_angle= car3.angle;
        distance=[car.dd car2.dd 0 ];
end

[max_value, max_index] = max(distance);              % 두번 째 큰값 가져오기

max_index2= max_index;

switch max_index2
    case 1
        max2_speed= car.d;
        max2_angle= car.angle;
        
    case 2
        max2_speed= car2.d;
        max2_angle= car2.angle;
        
    case 3
        max2_speed= car3.d;
        max2_angle= car3.angle;
        
end

%% reset 기능

if car.d==0 && car2.d==0 && car3.d==0
    
    % car = reset_car(color1, speed1,my_angle1);
    % car2 = reset_car(color2, speed2, my_angle2);
    % car3 = reset_car(color3, speed3, my_angle3);
    
    %% car1 reset
    car_x = [-1.5 0 0 -1.5];
    car_y = [-0.5 -0.5 0.5 0.5];
    
    s1_x = [-0.3 0 0 -0.3];
    s1_y = [0.3 0.3 0.5 0.5];
    s2_x =  [-0.3 0 0 -0.3];
    s2_y = [-0.3 -0.3 -0.5 -0.5];
    
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
    % 원점으로부터 움직인 거리
    car.speed = speed1;
    car.s1_speed = speed1;% 타이머가 불릴떄마다 차가 가는거리
    car.s2_speed = speed1;
    
    car.angle = my_angle1; % 이걸 인자로 줘서 변화시키자 각도
    
    car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3)  ) / 2;
    car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3)  ) / 2;
    
    %% car2 reset
    car2.x= car_x; car2.y= car_y;
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
    % 원점으로부터 움직인 거리
    car2.speed = speed2;
    car2.s1_speed = speed2;% 타이머가 불릴떄마다 차가 가는거리
    car2.s2_speed = speed2;
    
    car2.angle = my_angle2; % 이걸 인자로 줘서 변화시키자 각도
    
    car2.x_c = (2*car2.cx+car2.x(1,1)+car2.x(1,3)  ) / 2;
    car2.y_c = (2*car2.cy+car2.y(1,1)+car2.y(1,3)  ) / 2;
    
    
    %% car 3 reset
    car3.x= car_x; car3.y= car_y;
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
    % 원점으로부터 움직인 거리
    car3.speed = speed3;
    car3.s1_speed = speed3;% 타이머가 불릴떄마다 차가 가는거리
    car3.s2_speed = speed3;
    
    car3.angle = my_angle3; % 이걸 인자로 줘서 변화시키자 각도
    
    car3.x_c = (2*car3.cx+car3.x(1,1)+car3.x(1,3)  ) / 2;
    car3.y_c = (2*car3.cy+car3.y(1,1)+car3.y(1,3)  ) / 2;
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

set(handles.car.p, 'XData',X);
set(handles.car.p, 'YData',Y);
set(handles.car.s1, 'XData',SX1);
set(handles.car.s1, 'YData',SY1);
set(handles.car.s2, 'XData',SX2);
set(handles.car.s2, 'YData',SY2);
%그려놓은 것을 업데이트만 시켜줌 (단지 그림으로 보여주는 기능)

set(handles.car2.p, 'XData',X2);
set(handles.car2.p, 'YData',Y2);
set(handles.car2.s1, 'XData',SX21);
set(handles.car2.s1, 'YData',SY21);
set(handles.car2.s2, 'XData',SX22);
set(handles.car2.s2, 'YData',SY22);
% 그려놓은 것을 업데이트만 시켜줌 (단지 그림으로 보여주는 기능)

set(handles.car3.p, 'XData',X3);
set(handles.car3.p, 'YData',Y3);
set(handles.car3.s1, 'XData',SX31);
set(handles.car3.s1, 'YData',SY31);
set(handles.car3.s2, 'XData',SX32);
set(handles.car3.s2, 'YData',SY32);
% 그려놓은 것을 업데이트만 시켜줌 (단지 그림으로 보여주는 기능)

car.ppx = car.x_c;
car.ppy = car.y_c;
car2.ppx = car2.x_c;
car2.ppy = car2.y_c;
car3.ppx = car3.x_c;
car3.ppy = car3.y_c;

set(handles.editAnswer,'String', max1_speed);
set(handles.editAnswer2,'String', max1_angle);
set(handles.editAnswer3,'String', max2_speed);
set(handles.editAnswer4,'String', max2_angle);

handles.car= car;
handles.car2= car2;
handles.car3= car3;

guidata (hfigure, handles);