clc;
clear all;

load('ratings.dat');

rate_Number = length(ratings);     % 评价条数
users_Number = max(ratings(:,1));  % 用户个数
movies_Number = max(ratings(:,2)); % 电影个数

%% 1.构建'用户-电影'二分网络模型

A = zeros(users_Number,movies_Number);   % 二部图的邻接矩阵

k_User = zeros(6040,1); % 用户的度

k_Moive = zeros(3952,1);% 电影的度

count_Edge = 0;                 % 边的条数

edges = zeros(rate_Number,2);   % 边的两点信息集合

for i=1:rate_Number             %计算边的条数，构造二部图邻接矩阵，计算用户度，电影度
    if(ratings(i,3)>3)
        count_Edge = count_Edge+1;
        A(ratings(i,1),ratings(i,2))=1;
        edges(count_Edge,1:2) = ratings(i,1:2);
        k_User(ratings(i,1),1) = k_User(ratings(i,1),1)+1;
        k_Moive(ratings(i,2),1) = k_Moive(ratings(i,2),1)+1;
    end
end

%% 2.计算资源配额矩阵
W = zeros(movies_Number,movies_Number); % 利用公式计算
for i=1:movies_Number
    for j=1:movies_Number
        sum = 0;
        for l=1:users_Number
            if k_User(l,1) ~= 0
            sum = sum + A(l,i)*A(l,j)/k_User(l,1);
            end
        end
        W(i,j)=sum/k_Moive(j,1);
        if isnan(W(i,j))
            W(i,j) = 0;
        end
    end
end

%% 3.给出电影推荐度排名，选取对应用户推荐电影
 
A_grade = A * W;    % 对应项评分矩阵

A_grade_sort = zeros(users_Number,movies_Number);  % 排序后的对应项评分矩阵

A_favor = zeros(users_Number,5);

for i=1:users_Number
    [A_grade_sort(i,:),I] = sort(A_grade(i,:),'descend');
    A_favor(i,1:5) = I(1,1:5); % 为用户推荐评分最高的5个电影
end

xlswrite('recmdMovies.xls', A_favor);   % 保存为xls
