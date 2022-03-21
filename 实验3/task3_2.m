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

C_candi = (1:A_size); % 候选集

threshold = 0.25; % 设置阈值

C_set = [];

C_single = [];

club_number = 0;

while(~isempty(C_candi))  % 候选集不为空

    if isempty(C_single)
        rand_point = C_candi(floor(randi(length(C_candi))));  % 选取候选集内随机点作为当前社团C
        C_single = [C_single,rand_point];
        C_candi(C_candi==rand_point)=[];
        now_dens = density_average(S,C_single);
    else
        min_dens_diff = 100;  % 最小密度降低值，初始设为100，即为无穷大
        min_diff_point = 0;   % 最小密度降低节点

        for i=C_candi(1:length(C_candi))   
            C_temp = [C_single,i]; 
            temp_dens = density_average(S,C_temp);   % 求出当前社团密度
            dens_diff = now_dens - temp_dens;        % 求出社团密度降低值     

            if dens_diff < min_dens_diff             % 求出使得社团密度最小降低值和点
                min_dens_diff = dens_diff;
                min_diff_point = i;
            end
        end
            
        temp_dens = now_dens-min_dens_diff;     

        if temp_dens < threshold                 % 社团密度小于阈值则将其划分为一个社团
            C_set = [C_set,0,C_single];          % 社团间以0为分界
            club_number = club_number + 1;
            C_single = [];
        else
            C_candi(C_candi==min_diff_point)=[];  
            C_single = [C_single,min_diff_point]; % 将使得社团模块密度降低最小的那个节点v添加到当前社团
        end

        if isempty(C_candi)                  % 如果候选集最后为空，则划分最后一个社团
            C_set = [C_set,0,C_single];
            club_number = club_number + 1;
            C_single = [];
        end 
    end
end

C_set = [C_set,C_single];
