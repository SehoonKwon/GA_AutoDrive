function car_distance = distance_calcul(car_ppx,car_x_c,car_ppy,car_y_c,car_dd)

car_d_cal= sqrt((car_x_c-car_ppx)^2+(car_y_c-car_ppy)^2);

car_dd= car_dd+car_d_cal;
% disp(car_py);
% disp('-------');
% disp(car_cy);
car_distance= car_dd;
end