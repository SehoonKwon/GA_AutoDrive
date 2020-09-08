 function distance = sensor_distance(xdata, ydata, car_sensor_x, car_sensor_y, car_xc, car_yc, a, b)
 
        if car_sensor_x == car_xc
            if car_sensor_y > car_yc              % 90�� ����
                
%                  disp('90�� ����');
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
                
            elseif car_sensor_y < car_yc          % 270�� ����
                
                xx= car_sensor_y:-0.12:car_sensor_y-3.0;
%                  disp('270�� ����');
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
            
            if car_sensor_x > car_xc             % 0�� ����
%                 disp('0�� ����');
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
                
                
            elseif car_sensor_x < car_xc         % 180�� ����
                xx= car_sensor_x:-0.12:car_sensor_x-3.0;
%                 disp('180�� ����');
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
            
            if car_sensor_y > car_yc            % 45�� ����
%                 disp('45�� ����');
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
            elseif car_sensor_y < car_yc        % 315�� ����
%                   disp('315�� ����');
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
        
            if car_sensor_y > car_yc         % 135�� ����
%                 disp('135�� ����');
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
                
            elseif car_sensor_y < car_yc     % 225�� ����
                
                 xx= car_sensor_x:-0.12:car_sensor_x-3.0;
%                  disp('225�� ����');
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