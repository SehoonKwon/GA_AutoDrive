function move_car3 (obj, event,hfigure)

global W;
%%신호등
global cnt;
global color_timer1;
global color_timer2;
global flag;

cnt = cnt + 1;

if rem(cnt, 70) == 0
    flag =~flag;
    cnt = 0;
end

if flag == 0
    color_timer1 = 'k';
    color_timer2 = 'r';
else
    color_timer1 = 'g';
    color_timer2 = 'k';
end
%%

handles = guidata(hfigure);
car=handles.car;
track= handles.track;


speed1= 0.12;
my_angle1 = pi/50;

track.xtrans=transpose(track.xdata1);
track.ytrans=transpose(track.ydata1);

track.xtrans2=transpose(track.signal_x);
track.ytrans2=transpose(track.signal_y);

track.xtrans3=transpose(track.signal_x2);
track.ytrans3=transpose(track.signal_y2);

car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3) ) / 2; % car의 중심좌표
car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3) ) / 2;

car.sensor_1_3_x = ((car.s1_cx + car.s1_x(1,3))-car.x_c)*cos(car.angle) - ((car.s1_cy+car.s1_y(1,3)) - car.y_c)*sin(car.angle)+car.x_c;
car.sensor_1_3_y = ((car.s1_cx + car.s1_x(1,3))-car.x_c)*sin(car.angle) + ((car.s1_cy+car.s1_y(1,3)) - car.y_c)*cos(car.angle)+car.y_c;

a_l= ( car.y_c - car.sensor_1_3_y ) / (car.x_c -  car.sensor_1_3_x);
b_l= car.y_c-(car.x_c * a_l);                   % 왼쪽 센서의 관한 식

car.sensor_1_2_x = ((car.s2_cx + car.s2_x(1,2))-car.x_c)*cos(car.angle) - ((car.s2_cy+car.s2_y(1,2)) - car.y_c)*sin(car.angle)+car.x_c;
car.sensor_1_2_y =((car.s2_cx + car.s2_x(1,2))-car.x_c)*sin(car.angle) + ((car.s2_cy+car.s2_y(1,2)) - car.y_c)*cos(car.angle)+car.y_c;

a_r= ( car.y_c - car.sensor_1_2_y ) / (car.x_c -  car.sensor_1_2_x);
b_r= car.y_c-(car.x_c*a_r);                         % 오른쪽 센서의 관한 식

car.sensor_1_1_x = ((car.s3_cx + car.s3_x(1,3))-car.x_c)*cos(car.angle) - ((car.s3_cy+car.s3_y(1,3)) - car.y_c)*sin(car.angle)+car.x_c;
car.sensor_1_1_y = ((car.s3_cx + car.s3_x(1,3))-car.x_c)*sin(car.angle) + ((car.s3_cy+car.s3_y(1,3)) - car.y_c)*cos(car.angle)+car.y_c;


% 센서를 선택하게 만들어주는 코드
car.ssl= sensor_distance( track.xtrans, track.ytrans, car.sensor_1_3_x, car.sensor_1_3_y , car.x_c , car.y_c, a_l,b_l);  % 왼쪽 센서 거리
car.ssr = sensor_distance( track.xtrans, track.ytrans, car.sensor_1_2_x, car.sensor_1_2_y , car.x_c , car.y_c,a_r,b_r);  % 오른쪽 센서 거리

% 신호등 감지
verify_signal = sensor_signal(track.signal_x, track.signal_y, car.sensor_1_3_x, car.sensor_1_3_y);
verify_signal_2 = sensor_signal(track.signal_x, track.signal_y, car.sensor_1_2_x, car.sensor_1_2_y);
verify_signal2 = sensor_signal(track.signal_x2, track.signal_y2, car.sensor_1_3_x, car.sensor_1_3_y);
verify_signal2_2 = sensor_signal(track.signal_x2, track.signal_y2, car.sensor_1_2_x, car.sensor_1_2_y);
[neur_speed, neur_angle] = calcul_result(car.ssl, car.ssr, W(1,:));

%부딪히는 조건 
if car.ssl < 0.255 || car.ssr < 0.255
    car.d = 0;
    car.s1_d = 0;
    car.s2_d = 0;
    car.s3_d = 0;
    %%신호등 감지
elseif color_timer2 == 'r' && (verify_signal < 4.5 || verify_signal_2 < 4.5 || verify_signal2 < 4.5 || verify_signal2_2 < 4.5)
        car.d = 0;
        car.s1_d = 0;
        car.s2_d = 0;
        car.s3_d = 0;
%%
else
    car.angle = neur_angle+car.angle;
    car.px = car.cx; car.py =car.cy;
    car.d = neur_speed;
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
    
    car.s3_px = car.s3_cx; car.s3_py = car.s3_cy;
    car.s3_d=neur_speed;
    car.s3_cx = car.s3_px + car.s3_d*cos(car.angle);
    car.s3_cy = car.s3_py+ car.s3_d*sin(car.angle);
    
    car.x_c = (2*car.cx+car.x(1,1)+car.x(1,3)  ) / 2;
    car.y_c = (2*car.cy+car.y(1,1)+car.y(1,3)  ) / 2;
    
end

car.dd = distance_calcul(car.ppx,car.x_c,car.ppy,car.y_c,car.dd);

X = ((car.cx+car.x)-car.x_c)*cos(car.angle) - ((car.cy+car.y) - car.y_c)*sin(car.angle)+car.x_c;
Y = ((car.cx+car.x)-car.x_c)*sin(car.angle) + ((car.cy+car.y) - car.y_c)*cos(car.angle)+car.y_c;
SX1 = ((car.s1_cx + car.s1_x)-car.x_c)*cos(car.angle) - ((car.s1_cy+car.s1_y) - car.y_c)*sin(car.angle)+car.x_c;
SY1 = ((car.s1_cx + car.s1_x)-car.x_c)*sin(car.angle) + ((car.s1_cy+car.s1_y) - car.y_c)*cos(car.angle)+car.y_c;
SX2 = ((car.s2_cx + car.s2_x)-car.x_c)*cos(car.angle) - ((car.s2_cy+car.s2_y) - car.y_c)*sin(car.angle)+car.x_c;
SY2 = ((car.s2_cx + car.s2_x)-car.x_c)*sin(car.angle) + ((car.s2_cy+car.s2_y) - car.y_c)*cos(car.angle)+car.y_c;
SX3 = ((car.s3_cx + car.s3_x)-car.x_c)*cos(car.angle) - ((car.s3_cy+car.s3_y) - car.y_c)*sin(car.angle)+car.x_c;
SY3 = ((car.s3_cx + car.s3_x)-car.x_c)*sin(car.angle) + ((car.s3_cy+car.s3_y) - car.y_c)*cos(car.angle)+car.y_c;


set(handles.car.p, 'XData',X);
set(handles.car.p, 'YData',Y);
set(handles.car.s1, 'XData',SX1);
set(handles.car.s1, 'YData',SY1);
set(handles.car.s2, 'XData',SX2);
set(handles.car.s2, 'YData',SY2);
set(handles.car.s3, 'XData',SX3);
set(handles.car.s3, 'YData',SY3);
set(handles.Signal_light.blue, 'Facecolor' , color_timer1);
set(handles.Signal_light.red, 'Facecolor' , color_timer2);
set(handles.Signal_light.blue2, 'Facecolor' , color_timer1);
set(handles.Signal_light.red2, 'Facecolor' , color_timer2);

car.ppx = car.x_c;
car.ppy = car.y_c;

handles.car= car;

guidata (hfigure, handles);