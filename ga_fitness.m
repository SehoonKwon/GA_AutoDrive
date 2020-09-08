function [ y ] = ga_fitness(Move_distance)

proximity = Move_distance;

% 최대 값을 찾는 경우이므로 음수가 나온 경우에는 적합도 선택에서 제외되도록 0으로 설정
if proximity < 0
    proximity = 0;
end

proximityRate = (proximity / 125.35)*100; % 125.35는 완주했을 때 거리

%적합도의 최대수치는 100%. 100을 넘어간 경우는 선택되지 않도록 적합도를 0으로 설정
if proximityRate > 100 
        proximityRate = 0;
end

y = proximityRate;

end

