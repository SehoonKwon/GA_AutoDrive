function sensor_signal = sensor(xdata, ydata, car_sensor_x, car_sensor_y)
xx = car_sensor_y + 4 : 0.2 : car_sensor_y + 5;

for i = 1:length(xx)
    
    A = [xdata ydata];
    B = [car_sensor_x xx(i)];
    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
        'OutputAllIndices', true);
    
    if LIA==1 % 발견한 경우
        distance_x = A(LocAllB{1},1);
        distance_y = A(LocAllB{1},2);
        
        if size(distance_x)==1
            
            real_x = (A(LocAllB{1},1));
            real_y = (A(LocAllB{1},2));
            sensor_signal = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
            break;
        else
            distance_x = (A(LocAllB{1},1));
            distance_y = (A(LocAllB{1},2));
            real_x = mean(distance_x);
            real_y = mean(distance_y);
            sensor_signal = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
            break;
        end
        
    elseif ( i==length(xx) ) && (LIA==0) % 발견하지 못한경우
        sensor_signal = 100;
        break;
    end
end

end