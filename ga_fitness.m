function [ y ] = ga_fitness(Move_distance)

proximity = Move_distance;

% �ִ� ���� ã�� ����̹Ƿ� ������ ���� ��쿡�� ���յ� ���ÿ��� ���ܵǵ��� 0���� ����
if proximity < 0
    proximity = 0;
end

proximityRate = (proximity / 125.35)*100; % 125.35�� �������� �� �Ÿ�

%���յ��� �ִ��ġ�� 100%. 100�� �Ѿ ���� ���õ��� �ʵ��� ���յ��� 0���� ����
if proximityRate > 100 
        proximityRate = 0;
end

y = proximityRate;

end

