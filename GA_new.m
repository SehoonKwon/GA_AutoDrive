%Genetic Algorithm
function newW = GA_new(car_distance, gene)

% Define
global CN;
Size = 16; % Number of Weight

newW = zeros(CN, Size);
Child = zeros(CN, Size);

% Calculate Fitness
MaxFitness = 0;
TotalFitness = 0;
AvgFitness = 0;
Fitness = zeros(1, CN);

for Num = 1:CN
    Fitness(1, Num) = ga_fitness(car_distance(1,Num));
    if Fitness(1, Num) == 0
        Fitness(1, Num) = 0;
    end
    
    if MaxFitness < Fitness(1, Num) && Fitness(1,Num)  <= 100 % 최대 값 발견 시 갱신
        MaxFitness = Fitness(1, Num);
    end
    
    TotalFitness = TotalFitness + Fitness(1, Num);
end

AvgFitness = TotalFitness / CN;

%Selection
[max_value, max_index] = max(Fitness);
Parent_M = gene(max_index, :);
Child(1,:) = Parent_M;
Fitness(1, max_index) = 0;

[max_value, max_index] = max(Fitness);
Parent_F = gene(max_index, :);
Child(2,:) = Parent_F;
Fitness(1, max_index) = 0;

[max_value, max_index] = max(Fitness);
Parent_M_2 = gene(max_index, :);
Child(3,:) = Parent_M_2;
Fitness(1, max_index) = 0;

[max_value, max_index] = max(Fitness);
Parent_F_2 = gene(max_index, :);
Child(4,:) = Parent_F_2;

% Arithmetic Crossover
for Num = 5:CN - 2
    Cross_r = 0.5 + (1)*rand(); % 한 값으로 수렴되지 않게 랜덤한 소수를 곱한다.
    
    for j = 1:Size
        if Num < 7
            Child(Num, j) = Cross_r * ( (Parent_M(1,j) + Parent_F(1,j) ) / 2);
        else
            Child(Num, j) = Cross_r * ( (Parent_M_2(1,j) + Parent_F_2(1,j) ) / 2);
        end
    end
end

% Mutation
% 방법1)전형적 변이
for Num = CN-2 : CN
    for i = 1:Size
        Child(Num,i) = -7 + (14)*rand; % 돌연변이 시 세포의 값을 다시 초기값 범위내에서 랜덤 값 부여
    end
end

%     %방법2)
%     for i = 1:Size
%         if rand < MutationRate
%             Child(Num,i) = 0.9 + (0.2)*rand; % 돌연변이 시 세포의 값을 원하는 범위내에서 랜덤 값 부여
%         end
%     end

% end of generation

newW = Child; % return New W
end

