 function distance = sensor_distance(xdata, ydata, car_sensor_x, car_sensor_y, car_xc, car_yc, a, b)
 
        if car_sensor_x == car_xc
            if car_sensor_y > car_yc              % 90도 방향
                
%                  disp('90도 진행');
                xx= car_sensor_y:0.1:car_sensor_y+3.0;
                
                for i = 1:length(xx)
                
                    A = [xdata ydata];
                    
                    B = [ car_sensor_x  xx(i)];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        end
                        
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                        
                    end
                end
                
            elseif car_sensor_y < car_yc          % 270도 방향
                
                xx= car_sensor_y:-0.12:car_sensor_y-3.0;
%                  disp('270도 진행');
                for i = 1:length(xx)
                    
                    A = [xdata ydata];
                    B = [ car_sensor_x  xx(i)];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                            
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        end
                        
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                        
                    end
                end
            end
            
        elseif car_sensor_y== car_yc
            
            if car_sensor_x > car_xc             % 0도 방향
%                 disp('0도 진행');
                xx= car_sensor_x:0.12:car_sensor_x+3.0;
                
                for i = 1:length(xx)
                    
                    A = [xdata ydata];
                    B = [ xx(i)  car_sensor_y];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                            
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        end
                        
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                        
                    end
                end
                
                
            elseif car_sensor_x < car_xc         % 180도 방향
                xx= car_sensor_x:-0.12:car_sensor_x-3.0;
%                 disp('180도 진행');
                for i = 1:length(xx)
                    
                    A = [xdata ydata];
                    B = [ xx(i)  car_sensor_y];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                            
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        end
                        
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                        
                    end
                end
            end
            
        elseif car_sensor_x > car_xc
            
            if car_sensor_y > car_yc            % 45도 방향
%                 disp('45도 진행');
                xx= car_sensor_x:0.12:car_sensor_x+3.0;
                for i = 1:length(xx)
                    yy=a*xx(i)+b;
                    A = [xdata ydata];
                    B = [ xx(i) yy];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                          
                        end
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                    end
                    
                end
            elseif car_sensor_y < car_yc        % 315도 방향
%                   disp('315도 진행');
                  xx= car_sensor_x:0.12:car_sensor_x+3.0;
                for i = 1:length(xx)
                    yy=a*xx(i)+b;
                    A = [xdata ydata];
                    B = [ xx(i) yy];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                            
                        end
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                    end
                    
                end
            end
            
        elseif car_sensor_x < car_xc
        
            if car_sensor_y > car_yc         % 135도 방향
%                 disp('135도 진행');
                 xx= car_sensor_x:-0.12:car_sensor_x-3.0;
                for i = 1:length(xx)
                    
                    yy=a*xx(i)+b;
                    A = [xdata ydata];
                    B = [ xx(i) yy];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                            
                            
                        end
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                    end
                    
                end
                
            elseif car_sensor_y < car_yc     % 225도 방향
                
                 xx= car_sensor_x:-0.12:car_sensor_x-3.0;
%                  disp('225도 진행');
                for i = 1:length(xx)
                    
                    yy=a*xx(i)+b;
                    A = [xdata ydata];
                    B = [ xx(i) yy];
                    [LIA,LocAllB] = ismembertol(B, A, 0.04, 'ByRows', true, ...
                        'OutputAllIndices', true);
                    
                    
                    if LIA==1
                        distance_x = A(LocAllB{1},1);
                        distance_y = A(LocAllB{1},2);
                        
                        if size(distance_x)==1
                            
                            real_x = (A(LocAllB{1},1));
                            real_y = (A(LocAllB{1},2));
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                        else
                            distance_x = (A(LocAllB{1},1));
                            distance_y = (A(LocAllB{1},2));
                            real_x = mean(distance_x);
                            real_y=mean(distance_y);
                            distance = sqrt((car_sensor_x- real_x)^2+(car_sensor_y- real_y)^2);
                            break;
                            
                            
                        end
                    elseif ( i==length(xx) ) && (LIA==0)
                        distance = 100;
                    end
                    
                end
            end
        end