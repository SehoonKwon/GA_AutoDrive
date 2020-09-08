function car = Make_car(color,speed, my_angle)
car_x = [-0.5 1 1 -0.5];
car_y = [-0.3 -0.3 0.3 0.3];

s1_x = [0.7 1 1 0.7];
s1_y = [0.2 0.2 0.3 0.3];
s2_x = [0.7 1 1 0.7];
s2_y = [-0.2 -0.2 -0.3 -0.3];

car.p= patch(car_x,car_y,color);
car.s1= patch(s1_x,s1_y,'w');
car.s2 = patch(s2_x,s2_y,'w');

%% �ڵ����� �����̴� �⺻����
car.x= car_x; car.y= car_y;
car.s1_x = s1_x; car.s1_y = s1_y;
car.s2_x = s2_x; car.s2_y = s2_y;
car.cx=0;  car.cy= 0;
car.s1_cx = 0; car.s1_cy = 0;
car.s2_cx = 0; car.s2_cy = 0;
car.ssl=0; car.ssr=0;

% ���� �ʱ��� x�� y��ǥ
car.px= 0; car.py=0;
car.ppx=0; car.ppy=0;
car.s1_px = 0; car.s1_py = 0;
car.s2_px = 0; car.s2_py = 0;
car.angle =2 * pi; % ���� �����̴� ���� ����( 2pi �� x�� ���� �������)
car.d =0;
car.s1_d=0;
car.s2_d=0;
car.dd=0;
% �������κ��� ������ �Ÿ�
car.speed = speed;
car.s1_speed = speed;% Ÿ�̸Ӱ� �Ҹ������� ���� ���°Ÿ�
car.s2_speed = speed;

car.my_angle = my_angle; % �̰� ���ڷ� �༭ ��ȭ��Ű�� ����

end