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
    
    if MaxFitness < Fitness(1, Num) && Fitness(1,Num)  <= 100 % �ִ� �� �߰� �� ����
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
m = SelectedGen; %% ����Ʈ �� gene �ε���

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
    Cross_r = 0.5 + (1)*rand(); % �� ������ ���ŵ��� �ʰ� ������ �Ҽ��� ���Ѵ�.
    
    for j = 1:Size
        if rand < CrossoverRate
            Child(Num, j) = Cross_r * ( (Parent_M(1,j) + Parent_F(1,j) ) / 2);
        else
            Child(Num, j) = Parent_M(1,j);
        end
    end
end

% Mutation
% ���1)������ ����
for Num = 2 : CN
    if rand < MutationRate    
        for i = 1:Size
        Child(Num,i) = -3 + (6)*rand; % �������� �� ������ ���� �ٽ� �ʱⰪ ���������� ���� �� �ο�
        end
    end
end

%     %���2)
%     for i = 1:Size
%         if rand < MutationRate
%             Child(Num,i) = 0.9 + (0.2)*rand; % �������� �� ������ ���� ���ϴ� ���������� ���� �� �ο�
%         end
%     end

% end of generation

% Replacement // �� ���� ���յ��� ��쿡�� ���� ��ü, �츮�� ���� car_distance���̴� fitness�����ϴ�
% new�� �����ؼ� �� ��� ���Ұ�.
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

