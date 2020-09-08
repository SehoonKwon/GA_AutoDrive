%Genetic Algorithm
function newW = GA2(car_distance, gene)

% Define
global CN;
Size = 16; % Number of Weight
CrossoverRate = 0.8;
MutationRate = 0.01;

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

% Selection - Roulette wheel
% Select 1st Gen.
fSlice = rand * TotalFitness;

cfTotal = 0;
SelectedGen = 0;

for Num = 1:CN % 1~20
    cfTotal = cfTotal + Fitness(1, Num);
    if cfTotal > fSlice
        SelectedGen = Num;
        break;
    end
end

Parent_M = gene(SelectedGen, :);
m = SelectedGen; %% 셀렉트 된 gene 인덱스

%Select 2st Gen.
fSlice = rand * TotalFitness;
cfTotal = 0;
SelectedGen = 0;

for Num = 1:CN % 1~20
    cfTotal = cfTotal + Fitness(1, Num);
    if cfTotal > fSlice
        SelectedGen = Num;
        break;
    end
end

Parent_F = gene(SelectedGen, :);
f = SelectedGen;

%Elitism
Child(1,:) = Parent_M;

% Arithmetic Crossover
for Num = 2:CN
    Cross_r = 0.5 + (1)*rand(); % 한 값으로 수렴되지 않게 랜덤한 소수를 곱한다.
    
    for j = 1:Size
        if rand < CrossoverRate
            Child(Num, j) = Cross_r * ( (Parent_M(1,j) + Parent_F(1,j) ) / 2);
        else
            Child(Num, j) = Parent_M(1,j);
        end
    end
end

% Mutation
% 방법1)전형적 변이
for Num = 2 : CN
    if rand < MutationRate    
        for i = 1:Size
        Child(Num,i) = -3 + (6)*rand; % 돌연변이 시 세포의 값을 다시 초기값 범위내에서 랜덤 값 부여
        end
    end
end

%     %방법2)
%     for i = 1:Size
%         if rand < MutationRate
%             Child(Num,i) = 0.9 + (0.2)*rand; % 돌연변이 시 세포의 값을 원하는 범위내에서 랜덤 값 부여
%         end
%     end

% end of generation

% Replacement // 더 높은 적합도인 경우에만 세포 교체, 우리의 경우는 car_distance없이는 fitness못구하니
% new를 못구해서 이 방법 사용불가.
%     for Num = 1:CN
%         old = ga_fitness(gene(Num,:));
%         new = ga_fitness(Child(Num,:));
% 
%         if old < new
%             gene(Num,:) = Child(Num,:);
%         end
%     end
% 
%     newW = gene;
newW = Child; % return New W
end

