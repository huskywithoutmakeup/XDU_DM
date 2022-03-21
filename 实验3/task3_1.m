clc;
clear all;

%% 1.导入网络数据

A = gmlread('karate.gml');

%% 2.根据网络结构特征给出节点相似性度量指标

A_size = size(A,1);   % 网络节点个数

S = zeros(A_size,A_size); % 相似性矩阵-领域距离

for i=1:A_size
    for j=1:A_size
        S(i,j) = and_number(A,i,j)/or_number(A,i,j);
    end
end

%% 3.采用贪婪算法提取模块

C_all = (1:A_size);    % 定义社团成员全集
C_1 = [];              % 定义社团C1

rand_point = floor(randi(35));  % 选取初始随机点作为当前社团C，不同点得出聚类效果差别可能较大

C_1 = [C_1,rand_point];

C_2 = C_all(ismember(C_all,C_1)==0); % 定义另一个社团C2

now_dens = density_average(S,C_1);  % 利用平均邻域距离作为社团密度

threshold = 0.3; % 设置阈值/可调节

while(length(C_1) <= 32)  % 社团成员无法超过32个

    flag = 0;             % 用于判断是否还存在未聚类的邻居节点
    min_dens_diff = 100;  % 最小密度降低值，初始设为100，即为无穷大
    min_diff_point = 0;   % 最小密度降低节点

    for i=C_1(1:length(C_1))
        for j=C_2(1:length(C_2))    

            if A(i,j) == 1 % 提取社团C所有未聚类的邻居节点

                flag = 1;  % 说明存在未聚类的邻居节点

                C_1_temp = [C_1,j];  % 将其放入社团C1
                C_2_temp = C_all(ismember(C_all,C_1_temp)==0); % 从社团C2取出

                temp_dens = density_average(S,C_1_temp); % 求出当前社团密度
                dens_diff = now_dens - temp_dens;        % 求出社团密度降低值     

                if dens_diff < min_dens_diff     % 求出社团密度最小降低值和点
                    min_dens_diff = dens_diff;
                    min_diff_point = j;
                end
            end
        end
    end

    if flag == 0  % 如果不存在新的节点与已聚类的节点存在关系，则聚类停止
        break;
    end

    now_dens = now_dens-min_dens_diff; % 更新当前的社团密度值

    if now_dens >= threshold && min_diff_point~=0  % 社团密度值大于阈值则添加点
        C_1 = [C_1,min_diff_point];  % 将使得社团模块密度降低最小的那个节点v添加到社团C_1
        C_2 = C_all(ismember(C_all,C_1)==0); % 更新社团C2       
    end

    if now_dens < threshold  % 直到社团密度小于阈值则结束
        break;
    end
end

% 求取社团模块密度D
module_dens = dens1_number(A,C_1)-dens2_number(A,C_1)+dens1_number(A,C_2)-dens2_number(A,C_2); 
disp(module_dens);

% 显示社团聚类结果，由于视觉效果较差，还是使用Cytospace
displayRes(A,C_1);
% 导出画图数据
draw_data(A,C_1);

