function car = Make_car2(color,speed, my_angle)
car_x = [-1.5 0 0 -1.5];
car_y = [-0.5 -0.5 0.5 0.5];

s1_x = [-0.3 0 0 -0.3];
s1_y = [0.3 0.3 0.5 0.5];
s2_x =  [-0.3 0 0 -0.3];
s2_y = [-0.3 -0.3 -0.5 -0.5];
s3_x = [-0.3 0 0 -0.3];
s3_y = [-0.1 -0.1 0.1 0.1];

car.p= patch(car_x,car_y,color);
car.s1= patch(s1_x,s1_y,'w');
car.s2 = patch(s2_x,s2_y,'w');
car.s3 = patch(s3_x,s3_y,'w');

%% 자동차의 움직이는 기본설정
car.x= car_x; car.y= car_y;
car.s1_x = s1_x; car.s1_y = s1_y;
car.s2_x = s2_x; car.s2_y = s2_y;
car.s3_x = s3_x; car.s3_y = s3_y;
car.cx=0;  car.cy= 0;
car.s1_cx = 0; car.s1_cy = 0;
car.s2_cx = 0; car.s2_cy = 0;
car.s3_cx = 0; car.s3_cy = 0;
car.ssl=0; car.ssr=0; car.ssf=0;

% 차량 초기의 x와 y좌표
car.px= 0; car.py=0;
car.ppx=0; car.ppy=0;
car.s1_px = 0; car.s1_py = 0;
car.s2_px = 0; car.s2_py = 0;
car.s3_px = 0; car.s3_py = 0;
car.angle =2 * pi; % 차의 움직이는 방향 설정( 2pi 가 x축 양의 수평방향)
car.d =0;
car.s1_d=0;
car.s2_d=0;
car.s3_d=0;
car.dd=0;
% 원점으로부터 움직인 거리
car.speed = speed;
car.s1_speed = speed;% 타이머가 불릴떄마다 차가 가는거리
car.s2_speed = speed;
car.s3_speed = speed;

car.my_angle = my_angle; % 이걸 인자로 줘서 변화시키자 각도

end