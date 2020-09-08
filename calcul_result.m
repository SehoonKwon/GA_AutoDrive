function [speed, angle] = calcul_result(ssl, ssr, W) %W는 gene[i][16]의 배열

%% 1st layer
N3 = ssl * W(1,1) + ssr * W(1,4); %W(1,은 그냥 고정임. W라는 배열 1개 넘어오므로
N4 = ssl * W(1,2) + ssr * W(1,5);
N5 = ssl * W(1,3) + ssr * W(1,6);

N3 = 1 / ( 1 + exp(-N3) );
N4 = 1 / ( 1 + exp(-N4) );
N5 = 1 / ( 1 + exp(-N5) );

%%
N6 = N3 * W(1,7) + N4 * W(1,9) + N5 * W(1,11);
N7 = N3 * W(1,8) + N4 * W(1,10) + N5 * W(1,12);

N6 = 1 / ( 1 + exp(-N6) );
N7 = 1 / ( 1 + exp(-N7) );

%%
N8 = N6 * W(1,13) + N7 * W(1,15);
N9 = N6 * W(1,14) + N7 * W(1,16);

N8 = 1 / ( 1 + exp(-N8) );
N9 = 1 / ( 1 + exp(-N9) );

%% 속도계산
 if N8 >= 0 && N8 <0.1
        speed = 0.1;
    elseif  N8 >= 0.1 && N8 <0.2
        speed = 0.09;
    elseif  N8 >= 0.2 && N8 <0.3
        speed = 0.08;
    elseif  N8 >= 0.4 && N8 <0.5
        speed = 0.07;
    elseif  N8 >= 0.5 && N8 <0.6
        speed = 0.06;
    elseif  N8 >= 0.6 && N8 <0.7
        speed = 0.05;
    elseif  N8 >= 0.7 && N8 <0.8
        speed = 0.04;
    elseif  N8 >= 0.8 && N8 <0.9
        speed = 0.03;
    else
        speed = 0.02;
    end
%% 각도계산
if N9>= 0 && N9<0.05
    angle = -pi/4;
elseif N9>=0.05 && N9<0.15
    angle = -pi/6;
elseif N9>=0.15 && N9 <0.25
    angle = -pi/9;
elseif N9>=0.25 && N9 <0.35
    angle = -pi/12;
elseif N9>=0.35 && N9 <0.45
    angle = -pi/30;
elseif N9>=0.45 && N9 <0.5
    angle = 2*pi;
elseif N9>=0.5 && N9 <0.55
    angle = 2*pi;
elseif N9>=0.55 && N9 <0.65
    angle = pi/30;
elseif N9>=0.65 && N9 <0.75
    angle = pi/12;
elseif N9>= 0.75 && N9 <0.85
    angle = pi/9;
elseif N9>= 0.85 && N9 <0.95
    angle = pi/6;
else
    angle = pi/4;
end
%fprintf("N8 : %f   N9 : %f\n", N8,N9);
end
